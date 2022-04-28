`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2022 03:52:44 PM
// Design Name: 
// Module Name: topTB
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


module topTB;

reg reset, clock;

top UUT(.reset(reset), .clock(clock));

initial begin
    clock = 0;
    reset = 1;
    #5
    reset = 0;
end

always #5 clock = ~clock;

endmodule
