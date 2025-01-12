`timescale 1ns/1ps

module sequence_detector_tb;
    // Inputs
    reg clk;
    reg rst;
    reg in;

    // Outputs
    wire out;

    // Instantiate the Unit Under Test (UUT)
    sequence_detector uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    // Test sequence
    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        in = 0;

        // Apply reset
        #10 rst = 0;

        // Test sequence "1011"
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10; // out should be 1

        // Check overlapping sequence "1011"
        in = 1; #10; // out should be 0
        in = 0; #10; // out should be 0
        in = 1; #10; // out should be 0
        in = 1; #10; // out should be 1

        // Test resetting in between
        rst = 1; #10;
        rst = 0;

        // Another test sequence "1011"
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10; // out should be 1

        // Test different patterns
        in = 0; #10; // out should be 0
        in = 1; #10; // out should be 0
        in = 0; #10; // out should be 0
        in = 1; #10; // out should be 0
        in = 1; #10; // out should be 1

        // End simulation
        #20 $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time=%0d clk=%b rst=%b in=%b out=%b state=%b", $time, clk, rst, in, out, uut.state);
    end
endmodule
