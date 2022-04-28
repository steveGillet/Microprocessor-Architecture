`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Texas Tech University
// Engineer: Steve Gillet
// 
// Create Date: 02/21/2022
// Design Name: Vending Machine
// Module Name: homework3
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

module changeMaker(
    input clock,
    input [9:0] change,
    input hasNickel,
    input hasDime,
    input hasQuarter,
    input hasHalfDollar,
    input hasDollar,
    output reg nickelOut = 0,
    output reg dimeOut = 0,
    output reg quarterOut = 0,
    output reg halfDollarOut = 0,
    output reg dollarOut = 0
);

reg [9:0] changeDispensed = 0;

always @ (negedge clock) begin
        dollarOut = 0;
        halfDollarOut = 0;
        quarterOut = 0;
        dimeOut = 0;
        nickelOut = 0;
end

always @ (posedge clock) begin
    if(change>0)begin
        if(change - changeDispensed >= 100 & hasDollar) begin
            dollarOut = 1;
            changeDispensed = changeDispensed + 100;
        end
        else if(change - changeDispensed >= 50 & hasHalfDollar) begin
            halfDollarOut = 1;
            changeDispensed = changeDispensed + 50;
        end
        else if(change - changeDispensed >= 25 & hasQuarter) begin
            quarterOut = 1;
            changeDispensed = changeDispensed + 25;
        end
        else if(change - changeDispensed >= 10 & hasDime) begin
            dimeOut = 1;
            changeDispensed = changeDispensed + 10;
        end
        else if(change - changeDispensed >= 5 & hasNickel) begin
            nickelOut = 1;
            changeDispensed = changeDispensed + 5;
        end
    end        
 end

endmodule
