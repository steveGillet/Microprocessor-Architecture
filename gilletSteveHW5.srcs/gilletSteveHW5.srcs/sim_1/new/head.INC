parameter NOP = 7'b 0000000;
parameter ADD = 7'b 0000010;
parameter SUB = 7'b 0000101;
parameter SLT = 7'b 1100101;
parameter AND = 7'b 0001000;
parameter OR  = 7'b 0001010;
parameter XOR = 7'b 0001100;
parameter ST  = 7'b 0000001;
parameter LD  = 7'b 0100001;
parameter ADI = 7'b 0100010;
parameter SBI = 7'b 0100101;
parameter NOT = 7'b 0101110;
parameter ANI = 7'b 0101000;
parameter ORI = 7'b 0101010;
parameter XRI = 7'b 0101100;
parameter AIU = 7'b 1100010;
parameter SIU = 7'b 1000101;
parameter MOV = 7'b 1000000;
parameter LSL = 7'b 0110000;
parameter LSR = 7'b 0110001;
parameter JMR = 7'b 1100001;
parameter BZ  = 7'b 0100000;
parameter BNZ = 7'b 1100000;
parameter JMP = 7'b 1000100;
parameter JML = 7'b 0000111;

parameter NOPCW = 15'b 0_XX_00_X_0_XXXXX_X_X_X;
parameter ADDCW = 15'b 1_00_00_X_0_00010_0_0_X;
parameter SUBCW = 15'b 1_00_00_X_0_00101_0_0_X;
parameter SLTCW = 15'b 1_10_00_X_0_00101_0_0_X;
parameter ANDCW = 15'b 1_00_00_X_0_01000_0_0_X;
parameter ORCW  = 15'b 1_00_00_X_0_01010_0_0_X;
parameter XORCW = 15'b 1_00_00_X_0_01100_0_0_X;
parameter STCW  = 15'b 0_00_00_X_1_XXXXX_0_0_X;
parameter LDCW  = 15'b 1_01_00_X_0_XXXXX_X_0_X;
parameter ADICW = 15'b 1_00_00_X_0_00010_1_0_1;
parameter SBICW = 15'b 1_00_00_X_0_00101_1_0_1;
parameter NOTCW = 15'b 1_00_00_X_0_01110_X_0_X;
parameter ANICW = 15'b 1_00_00_X_0_01000_1_0_0;
parameter ORICW = 15'b 1_00_00_X_0_01010_1_0_0;
parameter XRICW = 15'b 1_00_00_X_0_01100_1_0_0;
parameter AIUCW = 15'b 1_00_00_X_0_00010_1_0_0;
parameter SIUCW = 15'b 1_00_00_X_0_00101_1_0_0;
parameter MOVCW = 15'b 1_00_00_X_0_00000_X_0_X;
parameter LSLCW = 15'b 1_00_00_X_0_10000_X_0_X;
parameter LSRCW = 15'b 1_00_00_X_0_10001_X_0_X;
parameter JMRCW = 15'b 0_XX_10_X_0_XXXXX_X_0_X;
parameter BZCW  = 15'b 0_XX_01_0_0_00000_1_0_1;
parameter BNZCW = 15'b 0_XX_01_1_0_00000_1_0_1;
parameter JMPCW = 15'b 0_XX_11_X_0_XXXXX_1_X_1;
parameter JMLCW = 15'b 1_00_11_X_0_00111_1_1_1;

parameter R0  = 5'd 0;
parameter R1  = 5'd 1;
parameter R2  = 5'd 2;
parameter R3  = 5'd 3;
parameter R4  = 5'd 4;
parameter R5  = 5'd 5;
parameter R6  = 5'd 6;
parameter R7  = 5'd 7;
parameter R8  = 5'd 8;
parameter R9  = 5'd 9;
parameter R10 = 5'd 10;
parameter R11 = 5'd 11;
parameter R12 = 5'd 12;
parameter R13 = 5'd 13;
parameter R14 = 5'd 14;
parameter R15 = 5'd 15;
parameter R16 = 5'd 16;
parameter R17 = 5'd 17;
parameter R18 = 5'd 18;
parameter R19 = 5'd 19;
parameter R20 = 5'd 20;
parameter R21 = 5'd 21;
parameter R22 = 5'd 22;
parameter R23 = 5'd 23;
parameter R24 = 5'd 24;
parameter R25 = 5'd 25;
parameter R26 = 5'd 26;
parameter R27 = 5'd 27;
parameter R28 = 5'd 28;
parameter R29 = 5'd 29;
parameter R30 = 5'd 30;
parameter R31 = 5'd 31;
