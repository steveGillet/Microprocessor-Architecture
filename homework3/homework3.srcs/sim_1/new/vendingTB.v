`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 03:47:37 PM
// Design Name: 
// Module Name: vendingTB
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


module vendingTB;

reg clock = 0;
reg nickel = 0;
reg dime = 0;
reg quarter = 0;
reg halfDollar = 0;
reg dollar = 0;
reg mtnDew = 0;
reg coke = 0;
reg water = 0;
reg sprite = 0;
reg fanta = 0;
reg cherryCoke = 0;
reg hasMtnDew = 0;
reg hasCoke = 0;
reg hasWater = 0;
reg hasSprite = 0;
reg hasFanta = 0;
reg hasCherryCoke = 0;
reg coinReturn = 0;
reg hasNickel = 0;
reg hasDime = 0;
reg hasQuarter = 0;
reg hasHalfDollar = 0;
reg hasDollar = 0;
reg hasChange = 0;

reg [4:0] nickelInv = 4;
reg [3:0] dimeInv = 0; 
reg [4:0] quarterInv = 0;
reg [4:0] halfDollarInv = 0;
reg [4:0] dollarInv = 0;

reg [3:0] mtnDewInv = 6;
reg [3:0] cokeInv = 6; 
reg [4:0] spriteInv = 3;
reg [3:0] waterInv = 6;
reg [4:0] fantaInv = 3;
reg [4:0] cherryCokeInv = 3;

wire mtnDewOut;
wire cokeOut;
wire spriteOut;
wire waterOut;
wire fantaOut;
wire cherryCokeOut;
wire nickelOut;
wire dimeOut;
wire quarterOut;
wire halfDollarOut;
wire dollarOut;
wire exactChangeOnly;

homework3 uut (clock, nickel,
dime,
quarter,
halfDollar,
dollar,
mtnDew,
coke,
water,
sprite,
fanta,
cherryCoke,
hasMtnDew,
hasCoke,
hasWater,
hasSprite,
hasFanta,
hasCherryCoke, 
coinReturn,
hasNickel,
hasDime,
hasQuarter,
hasHalfDollar,
hasDollar,
hasChange,
mtnDewOut,
cokeOut,
spriteOut,
waterOut,
fantaOut,
cherryCokeOut,
nickelOut,
dimeOut,
quarterOut,
halfDollarOut,
dollarOut,
exactChangeOnly);

initial begin
    #100
    dollar = 1;
    #10
    dollar = 0;
    #10
    mtnDew = 1;
    #10
    mtnDew = 0;
    dollar = 1;
    #10
    dollar = 0;
    
    
    
end

always @ (*)begin
    if(nickel)         nickelInv    =     nickelInv + 1;
    if(dime)             dimeInv    =       dimeInv + 1;
    if(quarter)       quarterInv    =    quarterInv + 1;
    if(halfDollar) halfDollarInv    = halfDollarInv + 1;
    if(dollar)         dollarInv    =     dollarInv + 1;

    if(nickelOut) nickelInv         =     nickelInv - 1;
    if(dimeOut) dimeInv             =       dimeInv - 1;
    if(quarterOut) quarterInv       =    quarterInv - 1;
    if(halfDollarOut) halfDollarInv = halfDollarInv - 1;
    if(dollarOut) dollarInv         =     dollarInv - 1;

    if(mtnDewOut) mtnDewInv         =     mtnDewInv - 1;
    if(cokeOut) cokeInv             =       cokeInv - 1;
    if(spriteOut) spriteInv         =     spriteInv - 1;
    if(waterOut) waterInv           =      waterInv - 1;
    if(fantaOut) fantaInv           =      fantaInv - 1;
    if(cherryCokeOut) cherryCokeInv = cherryCokeInv - 1;
    
    hasMtnDew     =     mtnDewInv > 0 ? 1 : 0;
    hasCoke       =       cokeInv > 0 ? 1 : 0;
    hasSprite     =     spriteInv > 0 ? 1 : 0;
    hasWater      =      waterInv > 0 ? 1 : 0;
    hasFanta      =      fantaInv > 0 ? 1 : 0;
    hasCherryCoke = cherryCokeInv > 0 ? 1 : 0;
    
    hasNickel     =     nickelInv > 0 ? 1 : 0;
    hasDime       =       dimeInv > 0 ? 1 : 0;
    hasQuarter    =    quarterInv > 0 ? 1 : 0;
    hasHalfDollar = halfDollarInv > 0 ? 1 : 0;
    hasDollar     =     dollarInv > 0 ? 1 : 0;
    
    hasChange     =   nickelInv >= 20 ? 1 : 0;
end

always #5 clock = ~clock;

endmodule
