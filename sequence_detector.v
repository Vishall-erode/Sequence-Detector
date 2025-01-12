module sequence_detector (
    input clk,
    input rst,
    input in,
    output reg out
);
    parameter IDLE = 0, S1 = 1, S10 = 2, S101 = 3, S1011 = 4;
    reg [2:0] state, next_state;

    // State Transition Logic (Synchronous)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next State Logic (Combinational)
    always @(*) begin
        case (state)
            IDLE: begin
                if (in) next_state = S1;
                else next_state = IDLE;
            end
            S1: begin
                if (!in) next_state = S10;
                else next_state = S1;
            end
            S10: begin
                if (in) next_state = S101;
                else next_state = IDLE;
            end
            S101: begin
                if (in) next_state = S1011;
                else next_state = IDLE;
            end
            S1011: begin
                if (in) next_state = S1; // Allow overlapping detection by moving to S1
                else next_state = S10;   // Allow overlapping detection by moving to S10
            end
            default: next_state = IDLE;
        endcase
    end

    // Output Logic (Synchronous)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out <= 0;
        end else if (state == S1011) begin
            out <= 1;
        end else begin
            out <= 0;
        end
    end
endmodule
