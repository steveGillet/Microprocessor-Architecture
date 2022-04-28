`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2022 01:31:26 AM
// Design Name: 
// Module Name: mfu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: mother fucker unit
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mfu(
    input      [31:0]  a, b,
    input      [4:0] sH, fS,
    output reg   v, n, c, z,
    output reg [31:0]     f
    );

`include "head.INC"

wire [63:0] logical;

assign logical = { 32'b0, a};

always @(*)
	begin
		case(fS)
            MOVCW[7:3], JMLCW[7:3]: {c,f} =             a;
              5'b00001            : {c,f} =         a + 1; 
            ADDCW[7:3]            : {c,f} =         a + b;        
            SUBCW[7:3]            : {c,f} =    a + ~b + 1;        
            ANDCW[7:3]            : {c,f} =         a & b;        
            ORCW [7:3]            : {c,f} =         a | b;        
            XORCW[7:3]            : {c,f} =         a ^ b;        
            NOTCW[7:3]            : {c,f} =            ~a;        
			      LSLCW[7:3]            : {c,f} = logical << sH;
			      LSRCW[7:3]            : {c,f} = logical >> sH;
			      default               : {c,f} =             0;
		endcase
        v = ( (fS == 5'b00001 | fS == 5'b00010 ) & ( (~a[31] & ~b[31] & f[31]) | (a[31] &  b[31] & ~f[31]) ) )      //addition
          | ( (fS == 5'b00101 | fS == 5'b00110 ) & ( (~a[31] &  b[31] & f[31]) | (a[31] & ~b[31] & ~f[31]) ) ) ; //subtraction
        n =     f[31];
        z = ~|f[31:0];
    end

endmodule
