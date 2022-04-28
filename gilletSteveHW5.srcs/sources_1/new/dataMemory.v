`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:29:59 03/30/2018 
// Design Name: 
// Module Name:    memDATA 
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
module dataMemory(
    input clk,
    input [6:0] address,
    input mW,
    input [31:0] dataIn,
    output [31:0] dataOut
    );

reg [31:0] memword [127:0];
integer i;

initial
  begin
  for(i=0; i<128; i=i+1)
    memword[i] <= i;					// for easier debugging
  end

always @ (posedge clk)
  begin
    if(mW)
	   memword[address] <= dataIn;
  end

assign dataOut = memword[address];

endmodule

