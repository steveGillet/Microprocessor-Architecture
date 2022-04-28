`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:33:36 08/30/2018
// Design Name:   B200_state_machine
// Module Name:   C:/Users/bnutter/Desktop/DT Docs/xilinx/simple_examples/B200_state_machine_tb.v
// Project Name:  simple_examples
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: B200_state_machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module B260_state_machine_tb;

	// Inputs
	reg clk;
	reg reset;
	reg X;

	// Outputs
	wire Y;

	// Instantiate the Unit Under Test (UUT)
	state_machine uut (
		.clk(clk), 
		.reset(reset), 
		.X(X), 
		.Y(Y) 
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		X = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		X = 1;
		#50;
		X = 0;
		#50;
		X = 1;
		#6;
		X = 0;
		#3;
		X = 1;
		#50;
		X = 0;

	end
   
	always
		#5 clk = ~clk;
endmodule