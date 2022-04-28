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
module homework1(
    input A,
    input B,
    input C,
    input D,
    output result
    );
											// 4 inputs (1 inverted) into two OR gates (2 each) into one AND gate
//wire AorD, BbarOrC, Bbar;

assign result = ((A | D) & (~B | C));       // simplified C-like boolean logic

//not										
//	g0(Bbar, B);					// Invert B to make Bbar
						
	
//or					
//    g1(AorD, A, D),					// OR A and D to make AorD
//	g2(BbarOrC, Bbar, C);			// OR C and Bbar (inverted B) to get BbarOrC
	
//and
//	g3(result, AorD, BbarOrC);	    // AND AorD and BbarOrC to get result

endmodule
