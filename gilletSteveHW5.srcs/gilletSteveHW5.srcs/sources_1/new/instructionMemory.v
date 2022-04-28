`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2022 05:41:50 PM
// Design Name: 
// Module Name: instructionMemory
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


module instructionMemory(
    input  [9:0]   pC,
    output [31:0]  iR
    );

`include "head.INC"

integer i;

parameter zFill3reg = 10'b 0;
parameter zFill2reg = 15'b 0;
parameter fill1     = 15'b 111111111111111;

reg [31:0] memword [255:0];
initial
  begin
    memword[0]  = {NOP,R0,R0,   zFill2reg};									
    memword[1]  = {ADD,R3,R4,R2,zFill3reg};									
    memword[2]  = {SUB,R1,R2,R3,zFill3reg};									
    memword[3]  = {SLT,R1,R2,R3,zFill3reg};									
    memword[4]  = {AND,R1,R2,R3,zFill3reg};									
    memword[5]  = {OR ,R1,R2,R3,zFill3reg};
    memword[6]  = {XOR,R1,R2,R3,zFill3reg};
    memword[7]  = {ST ,R0,R1,R2,zFill3reg};
    memword[8]  = {LD ,R1,R2,   zFill2reg};
    memword[9]  = {ADI,R1,R2,   zFill2reg};
    memword[10] = {SBI,R1,R2,   zFill2reg};
    memword[11] = {NOT,R1,R2,   zFill2reg};
    memword[12] = {ANI,R1,R2,   zFill2reg};
    memword[13] = {ORI,R1,R2,   zFill2reg};
    memword[14] = {XRI,R1,R2,   zFill2reg};
    memword[15] = {AIU,R1,R2,   zFill2reg};
    memword[16] = {SIU,R1,R2,   zFill2reg};
    memword[17] = {MOV,R1,R2,   zFill2reg};
    memword[18] = {LSL,R1,R2,zFill3reg,5'b00001};
    memword[19] = {LSR,R1,R3,zFill3reg,5'b00010};
    memword[20] = {JMR,R1,R0,   zFill2reg};
    memword[21] = {BZ ,R1,R0,   zFill2reg};
    memword[22] = {BNZ,R1,R0,       fill1};
    memword[23] = {JMP,R0,R0,       fill1};
    memword[24] = {JML,R1,R0,       fill1};

	 for(i=25; i< 256; i = i+1)
		memword[i] = 0;
  end


assign iR = memword[pC];

endmodule
