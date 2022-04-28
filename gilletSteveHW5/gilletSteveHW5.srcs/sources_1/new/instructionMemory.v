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
    // SET R3 AND R4 VALUES TO MULTIPLY
    memword[0]   = {ADI,R3,R3,               15'h    0};
    memword[1]   = {ADI,R4,R4,               15'h    0};
    
    // MAKE POSITIVE AND KEEP TRACK OF SIGN IN R7(R3) AND R8(R4)
    memword[2]   = {LSR,R7,R3,zFill3reg,      5'd   31};
    memword[3]   = {NOP,R0,R0,               15'd    0};
    memword[4]   = {BZ ,R7,R7,               15'd    5};
    memword[5]   = {NOP,R0,R0,               15'd    0};
    memword[6]   = {NOP,R0,R0,               15'd    0};
    memword[7]   = {NOT,R3,R3,zFill2reg               };
    memword[8]   = {NOP,R0,R0,               15'd    0};
    memword[9]   = {NOP,R0,R0,               15'd    0};
    memword[10]  = {INC,R3,R3,zFill2reg               };

    memword[11]  = {LSR,R8,R4,zFill3reg,      5'd   31};
    memword[12]  = {NOP,R0,R0,               15'd    0};
    memword[13]  = {BZ ,R8,R8,               15'd    5};	
    memword[14]  = {NOP,R0,R0,               15'd    0};
    memword[15]  = {NOP,R0,R0,               15'd    0};								
    memword[16]  = {NOT,R4,R4,zFill2reg               };
    memword[17]  = {NOP,R0,R0,               15'd    0};
    memword[18]  = {NOP,R0,R0,               15'd    0};
    memword[19]  = {INC,R4,R4,zFill2reg               };

    // Look at first bit of R4, if 1 then shift R3 and add to R1 and bits on the other side to R2

    memword[20]  = {ANI, R9, R4,               15'b    1};
    memword[21]  = {NOP, R0, R0,               15'd    0};
    memword[22]  = {NOP, R0, R0,               15'd    0};
    memword[23]  = {NOP, R0, R0,               15'd    0};
    memword[24]  = {NOP, R0, R0,               15'd    0};
    memword[25]  = {BZ , R9, R9,               15'd    4};
    memword[26]  = {NOP, R0, R0,               15'd    0};
    memword[27]  = {NOP, R0, R0,               15'd    0};
    memword[28]  = {ADD, R1, R1,       R3,     zFill3reg};	
    memword[29]  = {ADI, R5, R5,               15'd    1};
    memword[30]  = {ADD, R2, R2,       R5,     zFill3reg};	
    memword[31]  = {LSR, R4, R4,zFill3reg,      5'b    1};
    memword[32]  = {DEC,R31,R31,               zFill2reg};
    memword[33]  = {LSL, R3, R3,zFill3reg,      5'b    1};
    memword[34]  = {LSL, R5, R5,zFill3reg,      5'b    1};
    memword[35]  = {BNZ,R31,R31,     15'b111111111101111};

    // add signs back

    memword[36]  = {NOP, R0, R0,               15'd    0};
    memword[37]  = {NOP, R0, R0,               15'd    0};
    memword[38]  = {XOR,R10, R7,       R8,     10'd    0};
    memword[39]  = {NOP, R0, R0,               15'd    0};
    memword[40]  = {NOP, R0, R0,               15'd    0};
    memword[41]  = {BZ ,R10,R10,               15'd    9};
    memword[42]  = {NOP, R0, R0,               15'd    0};
    memword[43]  = {NOP, R0, R0,               15'd    0};
    memword[44]  = {NOT, R2, R2,               zFill2reg};
    memword[45]  = {NOP, R0, R0,               15'd    0};
    memword[46]  = {NOP, R0, R0,               15'd    0};
    memword[47]  = {INC, R2, R2,               zFill2reg};
    memword[48]  = {NOT, R1, R1,               zFill2reg};
    memword[49]  = {NOP, R0, R0,               15'd    0};
    memword[50]  = {NOP, R0, R0,               15'd    0};
    memword[51]  = {INC, R1, R1,               zFill2reg};
    

	 for(i=52; i< 256; i = i+1)
		memword[i] = 0;
  end

assign iR = memword[pC];

endmodule
