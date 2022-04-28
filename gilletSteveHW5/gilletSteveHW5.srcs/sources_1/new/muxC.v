`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2022 12:25:34 PM
// Design Name: 
// Module Name: muxC
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


module muxC(
    input            reset,
    input      [9:0]  pCin,
    input      [9:0]   brA,
    input      [31:0]  rAA,
    input      [1:0]    bS,
    input               pS,
    input                z,
    output reg [9:0] pCout
    );
    
reg [1:0] sel;
    
always @ (*) begin
    if (reset) pCout = 0;

    else begin 
        sel = {bS[1], ((bS[1] | (pS ^ z)) & bS[0])}; 
    
        casex(sel)
            2'b00:   pCout = pCin + 1;
            2'bX1:   pCout =      brA;
            2'b10:   pCout = rAA[9:0];
            default: pCout =        0;
        endcase    
    end
end

endmodule

