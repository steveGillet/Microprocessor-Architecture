`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:     Texas Tech University
// Engineer:    Steve Gillet
//
// Create Date:   1/13/2022
// Design Name:   homework1
// Module Name:   "C:\Users\steph\OneDrive\Desktop\School\Microprocessor Architecture\homework1\homework1.srcs\sources_1\new\homework1.v"
// Project Name:  homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// 4 Input (1 Inverted), Two Or Gates, One And Gate
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module homework1TB;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg D;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	homework1 uut (
		.A(A), 
		.B(B), 
		.C(C),
		.D(D), 
		.result(result)
	);

   integer i;

	initial begin
		// Initialize Inputs
		// Wait 100 ns for global reset to finish
		#100;
        
		for(i=0; i<16; i = i + 1)
		  begin
		    {C,B,D,A} = i;
			#10;
		  end

	end
      
endmodule

