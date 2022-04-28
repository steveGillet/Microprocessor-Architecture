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


module homework2two(
    input [4:0] fS,         //function select
    input [31:0] a,         //inputs a and b
    input [31:0] b,         
    output reg [31:0] f     //output f    
    );

always @(*)
    begin    
        case(fS)
            0:
                f=a;        // transfer a    
            1:
                f=a+1;      // increment a
            2:
                f=a+b;      // add a and b
            3:
                f=a+b+1;    // add a and b with carry
            4:
                f=a+~b;     // a + 1s compliment b
            5:
                f=a+~b+1;   // subtract b from a
            6:       
                f=a-1;      // decrement a
            7:       
                f=a;        // transfer a
            8:       
                f=a&b;      // a AND b
            10:       
                f=a|b;      // a OR b
            12:       
                f=a^b;      // a XOR b
            14:       
                f=~a;       // NOT a
            16:       
                f=b;        // transfer b
            20:       
                f=b>>1;     // shift b right
            24:       
                f=b<<1;     // shift b left                                                 
        endcase 
   end
    
    
endmodule