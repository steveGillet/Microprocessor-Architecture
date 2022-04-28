`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2022 03:28:32 PM
// Design Name: 
// Module Name: homework2TB
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


module homework2TB;
    
    reg [2:0]      gS;
    reg       carryIn;
    reg [1:0]           hSel;
    reg           mFs;
    reg [31:0]      a;
    reg [31:0]      bA;
    reg [31:0]      bS;
    wire            v;
    wire            c;
    wire            n;
    wire            z;
    wire [31:0]     f;
    
    functionUnit uut (
        .gS(gS),
        .carryIn(carryIn),
        .hSel(hSel),
        .mFs(mFs),
        .a(a),
        .bA(bA),
        .bS(bS),
        .v(v),
        .c(c),
        .n(n),
        .z(z),
        .f(f)
    );
    
integer i;    
    
    initial begin
        
        #100
        hSel = 0;
        for(i=0; i<26; i = i+1)    // for loop steps through all functions one by one     
         begin                     // there is not a function for every int so a few steps are wasted 
          {mFs, gS, carryIn} = i;                  // but you can see in the simulation when stuff happens and actually changes 
          if(mFs == 1)
            hSel = hSel + 1;
          a = i + 1;               // a and b are set to i + 1 and i + 2 so that they are different and constantly changing 
          bA = i + 2;
          bS = i + 2;   
          #10;
         end
    end
endmodule
