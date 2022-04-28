`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2022 08:30:01 PM
// Design Name: 
// Module Name: muxD
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


module muxD(
    input      [31:0] f, dataOut, nXORv,
    input      [1:0]                 mD,
    output reg [31:0]              busD
    );
    
    always @ (*) begin
        case(mD)
            2'b00:   busD =       f;
            2'b01:   busD = dataOut;
            2'b10:   busD =   nXORv;
            default: busD =       0;
        endcase
    end
endmodule
