`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Texas Tech University
// Engineer: Steve Gillet
// 
// Create Date: 02/07/2022 10:39:10 PM
// Design Name: Function Unit for a Datapath
// Module Name: homework2two
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Microprocessor Architecture HW 2 
// 
//////////////////////////////////////////////////////////////////////////////////

module homework2twoTB;
    
    reg [4:0] fS;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] f;
    
    homework2two uut (
        .fS(fS),
        .a(a),
        .b(b),
        .f(f)
    );
    
integer i;    
    
    initial begin
        
        #100
        for(i=0; i<25; i = i+1)    // for loop steps through all functions one by one     
         begin                     // there is not a function for every int so a few steps are wasted 
          fS = i;                  // but you can see in the simulation when stuff happens and actually changes 
          a = i + 1;               // a and b are set to i + 1 and i + 2 so that they are different and constantly changing 
          b = i + 2;   
          #10;
         end
    end
endmodule

