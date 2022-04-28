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


module alu(
    input [2:0] gS,         //function select
    input [31:0] a,         //inputs a and b
    input [31:0] bA,
    input carryIn,         
    output reg [31:0] g,     //output g    
    output reg v,
    output reg c
    );
   

always @(*)
    begin    
        case(gS)
            0:
             begin
              if(~carryIn)
               assign {c,g}=a;        // transfer a
              else     
               assign {c,g}=a+1;      // increment a
             end   
            1:
             begin
               if(~carryIn) 
                assign {c,g}=a+bA;      // add a and b
               else          
                assign {c,g}=a+bA+1;    // add a and b with carry
             end
            2:
             begin
              if(~carryIn)
                assign {c,g}=a+~bA;     // a + 1s compliment b
              else
                assign {c,g}=a+~bA+1;   // subtract b from a
             end
            3:
             begin
              if(~carryIn)       
                assign {c,g}=a-1;      // decrement a
              else  
                assign {c,g}=a;        // transfer a
             end
            4:       
                assign {c,g}=a&bA;      // a AND b
            5:       
                assign {c,g}=a|bA;      // a OR b
            6:       
                assign {c,g}=a^bA;      // a XOR b
            7:       
                assign {c,g}=~a;       // NOT a                                                 
        endcase
        v = carryIn ^ c; 
   end
    
    
endmodule