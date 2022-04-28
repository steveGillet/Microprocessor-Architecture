`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2022 02:36:10 PM
// Design Name: 
// Module Name: homework2
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


module functionUnit(
    input [2:0]       gS,
    input        carryIn,
    input [1:0]          hSel,
    input            mFs,
    input [31:0]       a,
    input [31:0]      bA,
    input [31:0]      bS,
    output             v,
    output             c,
    output  reg        n,
    output  reg        z,
    output      [31:0] f
    );
    
wire [31:0] g;
wire [31:0] h;

barrelShift barrelShift(.bS(bS), .hSel(hSel), .h(h));
alu alu(.gS(gS), .a(a), .bA(bA), .carryIn(carryIn), .g(g), .v(v), .c(c));         
muxF muxF(mFs, g, h, f);

initial begin
    z=0;
end

always @(*)
   begin    
    if(g==0)
        z = 1;
    n = g[31]; 
   end
    
endmodule
