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

module homework3(
        input clock,
        input nickel,
        input dime,
        input quarter,
        input halfDollar,
        input dollar,
        input mtnDew,
        input coke,
        input water,
        input sprite,
        input fanta,
        input cherryCoke,
        input hasMtnDew,
        input hasCoke,
        input hasWater,
        input hasSprite,
        input hasFanta,
        input hasCherryCoke, 
        input coinReturn,
        input hasNickel,
        input hasDime,
        input hasQuarter,
        input hasHalfDollar,
        input hasDollar,
        input hasChange,
        output mtnDewOut,
        output cokeOut,
        output spriteOut,
        output waterOut,
        output fantaOut,
        output cherryCokeOut,
        output nickelOut,
        output dimeOut,
        output quarterOut,
        output halfDollarOut,
        output dollarOut,
        output reg exactChangeOnly = 0
    );
    
wire [9:0] change;    
wire approved;
    
reg [6:0] moneyIn     = 0;
reg purchase;
reg mtnDewPending     = 0;
reg cokePending       = 0;
reg spritePending     = 0;
reg waterPending      = 0;
reg fantaPending      = 0;
reg cherryCokePending = 0;

assign mtnDewOut     = approved & mtnDewPending     &     hasMtnDew;
assign cokeOut       = approved & cokePending       &       hasCoke;
assign spriteOut     = approved & spritePending     &     hasSprite;
assign waterOut      = approved & waterPending      &      hasWater;
assign fantaOut      = approved & fantaPending      &      hasFanta;
assign cherryCokeOut = approved & cherryCokePending & hasCherryCoke;

coinCounter coinCounter(clock, moneyIn, purchase, coinReturn, change, approved);
changeMaker changeMaker(clock, change, hasNickel, hasDime, hasQuarter, hasHalfDollar, hasDollar, nickelOut, dimeOut, quarterOut, halfDollarOut, dollarOut);

always @(posedge clock) begin
    if      (nickel)      moneyIn = 5;
    else if (dime)       moneyIn = 10;
    else if (quarter)    moneyIn = 25;
    else if (halfDollar) moneyIn = 50;
    else if (dollar)    moneyIn = 100;
    else                  moneyIn = 0;
    
    purchase = (mtnDewPending & hasMtnDew) | (cokePending & hasCoke) | (waterPending & hasWater) | (spritePending & hasSprite) | (fantaPending & hasFanta) | (cherryCokePending & hasCherryCoke);
    
    if(~hasChange) exactChangeOnly = 1;

    if(mtnDew)         mtnDewPending = 1;
    if(coke)             cokePending = 1;
    if(sprite)         spritePending = 1;
    if(water)           waterPending = 1;
    if(fanta)           fantaPending = 1;
    if(cherryCoke) cherryCokePending = 1;

    if(mtnDewOut)         mtnDewPending = 0;
    if(cokeOut)             cokePending = 0;
    if(spriteOut)         spritePending = 0;
    if(waterOut)           waterPending = 0;
    if(fantaOut)           fantaPending = 0;
    if(cherryCokeOut) cherryCokePending = 0;
end    
    
    
endmodule
