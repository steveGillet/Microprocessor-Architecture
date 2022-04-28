`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2022 12:05:09 AM
// Design Name: 
// Module Name: constantUnit
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


module constantUnit(
    input [31:0] iR,
    input cS,
    output [31:0] iMout
    );
    
    assign iMout = cS ? {{17{iR[14]}}, iR[14:0]} : { 17'b0, iR[14:0]};
    
    
endmodule
