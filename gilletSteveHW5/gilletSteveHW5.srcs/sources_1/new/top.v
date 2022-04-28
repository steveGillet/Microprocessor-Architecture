`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2022 12:25:14 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: sloppy toppy
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input reset, clock
    );
    reg  [31:0]             a, b, rAA, dataIn; 
    reg  [31:0]       nXORv, dataOutReg, fReg; 
    reg  [31:0]                  iRreg, dData; 
    reg   [9:0]                    pcReg, pc1;
    reg   [6:0]                       address;
    reg   [4:0]       aAreg, bAreg, fSreg, sH;
    reg   [4:0]          sHex, daWBreg, dAreg;
    reg   [1:0]         bSreg, mdWBreg, mDreg;
    reg         vReg, cReg, nReg, zReg, mWreg;
    reg                 pSreg, rwWBreg, rWreg;
    wire [31:0]       iR, iMout, aData, bData;
    wire [31:0]        f, dataOut, busA, busB;
    wire [31:0]                          busD;
    wire  [9:0]                pCoutMuxC, brA;
    wire  [4:0]                fS, dA, aA, bA;
    wire  [1:0]                        mD, bS;
    wire               rW, pS, mW, mA, mB, cS;
    wire                           v, c, n, z;

    initial begin
        {pcReg, pc1, a, b, rAA, dataIn, nXORv, dataOutReg, fReg, iRreg, dData, address, vReg, cReg, nReg, zReg, mWreg, pSreg, rWreg, aAreg, bAreg, fSreg, sH, sHex, dAreg, mDreg} = 0;
    end

    muxC muxC(.reset(reset), .pCin(pcReg), .brA(brA), .rAA(rAA), .bS(bSreg), .pS(pSreg), .z(z), .pCout(pCoutMuxC));
    instructionMemory instructionMemory(.pC(pcReg), .iR(iR));
    instructionDecoder instructionDecoder(.iR(iRreg), .mD(mD), .bS(bS), .rW(rW), .pS(pS), .mW(mW), .mA(mA), .mB(mB), .cS(cS), .fS(fS), .dA(dA), .aA(aA), .bA(bA));
    constantUnit constantUnit(.cS(cS), .iR(iRreg), .iMout(iMout));
    registerFile registerFile(.aA(aA), .bA(bA), .clock(clock), .reset(reset), .rW(rwWBreg), .dA(daWBreg), .dData(busD), .aData(aData), .bData(bData));
    muxA muxA(.pC(pc1), .aData(aData), .mA(mA), .busA(busA));
    muxB muxB(.iMout(iMout), .bData(bData), .mB(mB), .busB(busB));
    dataMemory dataMemory(.clk(clock), .address(a[6:0]), .mW(mWreg), .dataIn(b), .dataOut(dataOut));
    mfu mfu(.a(a), .b(b), .sH(sHex), .fS(fSreg), .v(v), .n(n), .c(c), .z(z), .f(f));
    adder adder(.pC(pcReg), .b(b), .brA(brA));
    muxD muxD(.f(fReg), .dataOut(dataOutReg), .nXORv(nXORv), .mD(mdWBreg), .busD(busD));


    always@(negedge clock) begin
        if (reset) begin
            {pcReg, pc1, a, b, rAA, dataIn, nXORv, dataOutReg, fReg, iRreg, dData, address, vReg, cReg, nReg, zReg, mWreg, pSreg, rWreg, aAreg, bAreg, fSreg, sH, sHex, dAreg, mDreg} = 0;
        end

        else begin
            // IF
            pcReg      <=        pCoutMuxC;
            
            // DOF
            pc1        <=        pcReg + 1;
            iRreg      <=               iR; 
            sH         <=          iR[4:0];

            // EX
            rWreg      <=               rW;
            dAreg      <=               dA;
            mDreg      <=               mD;
            bSreg      <=               bS;
            pSreg      <=               pS;
            mWreg      <=               mW;
            fSreg      <=               fS;
            sHex       <=               sH;
            zReg       <=                z;

            a          <=             busA;
            rAA        <=             busA;
            b          <=             busB;

            // WB
            rwWBreg    <=            rWreg;
            daWBreg    <=            dAreg;
            mdWBreg    <=            mDreg;
            nXORv      <= {31'b0, (n ^ v)};
            fReg       <=                f;
            dataOutReg <=          dataOut;
        end 
    end

endmodule
