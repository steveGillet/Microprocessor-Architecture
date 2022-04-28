`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2022 12:29:40 PM
// Design Name: 
// Module Name: muxF
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


module muxF(
        input             mFs,  // MF select
        input      [31:0] g,
        input      [31:0] h,
        output reg [31:0] f
    );
    
always @(*)
   begin                       // mux outputs g if 0, h if 1
        if(mFs)            // g is from ALU and h is from shifter
            assign f = h;
        else
            assign f = g;     
   end
    
endmodule
