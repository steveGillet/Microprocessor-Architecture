`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2022 11:00:10 PM
// Design Name: 
// Module Name: instructionDecoder
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


module instructionDecoder(
    input   [31:0]                     iR,
    output         rW, pS, mW, mA, mB, cS,
    output  [1:0]                  mD, bS,
    output  [4:0]          fS, dA, aA, bA
    );
    
reg [14:0] cW = 0;
`include "head.INC"

always @ (*) begin
    case(iR[31:25])
        NOP:     cW = NOPCW;
        ADD:     cW = ADDCW;
        SUB:     cW = SUBCW;
        SLT:     cW = SLTCW;
        AND:     cW = ANDCW;
         OR:     cW = ORCW;
        XOR:     cW = XORCW;
         ST:     cW =  STCW;
         LD:     cW =  LDCW;
        ADI:     cW = ADICW;
        SBI:     cW = SBICW;
        NOT:     cW = NOTCW;
        ANI:     cW = ANICW;
        ORI:     cW = ORICW;
        XRI:     cW = XRICW;
        AIU:     cW = AIUCW;
        SIU:     cW = SIUCW;
        MOV:     cW = MOVCW;
        LSL:     cW = LSLCW;
        LSR:     cW = LSRCW;
        JMR:     cW = JMRCW;
         BZ:     cW =  BZCW;
        BNZ:     cW = BNZCW;
        JMP:     cW = JMPCW;
        JML:     cW = JMLCW;
        default: cW = 15'b0;
    endcase  
end    
assign {rW, mD, bS, pS, mW, fS, mB, mA, cS} = cW;
assign dA = iR[24:20];
assign aA = iR[19:15];
assign bA = iR[14:10];
endmodule
