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


module muxA(
    input     [9:0]    pC,
    input    [31:0] aData,
    input              mA,
    output   [31:0]  busA
    );

assign busA = mA ? pC : aData;

endmodule
