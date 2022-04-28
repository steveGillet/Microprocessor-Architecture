`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 03:19:40 PM
// Design Name: 
// Module Name: coinCounter
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


module coinCounter(
        input clock,
        input [6:0] moneyIn,
        input purchase,
        input coinReturn,
        output reg [9:0] change=0,
        output reg approved = 0
    );

reg [9:0] balance = 0;
    
always @(posedge clock) begin
    balance = balance + moneyIn;
    if(purchase && balance >= 175) begin
        balance = balance - 175;
        change = balance;
        balance = 0;
        approved = 1;
    end
    else approved = 0;
    if(coinReturn && balance > 0) begin
        change = balance;
        balance = 0;
    end
end
    
endmodule
