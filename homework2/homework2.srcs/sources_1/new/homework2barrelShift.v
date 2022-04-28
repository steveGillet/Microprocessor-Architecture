`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:23 03/30/2018 
// Design Name: 
// Module Name:    barrelshifter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module barrelShift(
    input [31:0] bS,
    input [1:0] hSel,         // mode select
    output reg [31:0] h
    );

always @(*)
	begin
		case(hSel)
			1: 	 assign h = bS >> 1;
			2: 	 assign h = bS << 1;
			default: assign h = bS;
		endcase
	end
endmodule
