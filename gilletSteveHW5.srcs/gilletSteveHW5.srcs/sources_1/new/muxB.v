`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2022 12:57:44 AM
// Design Name: 
// Module Name: muxA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module muxB(
    input    [31:0] iMout,
    input    [31:0] bData,
    input              mB,
    output   [31:0]  busB
    );

assign busB = mB ? iMout : bData;

endmodule

