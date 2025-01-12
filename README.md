# Sequence-Detector
Sequence Detector
This repository contains the Verilog implementation of a Sequence Detector, a finite state machine (FSM) designed to detect specific sequences of binary bits in a data stream. The design can be configured to detect any desired sequence and is implemented using  and Moore state machine model.

Overview
A Sequence Detector is a digital circuit that identifies a specific sequence of bits within a continuous stream of input data. The circuit uses a finite state machine to transition between states and detect the target sequence.

For example, a sequence detector can be designed to detect the binary sequence 1011. When the input data stream contains this sequence, the detector asserts an output signal.

Features
Supports  Moore model for FSM implementation.
Configurable to detect any binary sequence.
Designed in Verilog for easy simulation and synthesis.
Includes a testbench to verify functionality with various input cases.
