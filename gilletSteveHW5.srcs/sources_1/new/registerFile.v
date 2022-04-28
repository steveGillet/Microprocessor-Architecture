`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2022 12:34:36 AM
// Design Name: 
// Module Name: registerFile
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


module registerFile(
    input                clock,     
    input                reset,
	input                   rW,
    input   [4:0]   aA, bA, dA,
    input  [31:0]        dData,
    output [31:0]        aData,
    output [31:0]        bData
    );

reg [31:0] data [31:0];

assign aData = data [aA];
assign bData = data [bA];

integer counter;

initial begin
	for(counter = 0; counter < 32; counter = counter + 1)
		data [counter] = counter;								
	    data       [1] =              0;
	    data       [2] =              0;
	    data       [3] = 32'h 7FFF_FFFF;
	    data       [4] = 32'h 7FFF_FFFF;
	    data       [5] =              0;
end	
		
always @(posedge clock)
	begin
		if(reset)
			for(counter = 0; counter < 32; counter = counter + 1) begin
				data [counter] <= 0;
				data       [1] =              0;
	    		data       [2] =              0;
	    		data       [3] = 32'h 7FFF_FFFF;
	    		data       [4] = 32'h 7FFF_FFFF;
	    		data       [5] =              0;								
	    	end	
		else if(rW)	begin													
			data[dA] <= dData;
			data [0] <=     0;	
		end		
	end
	
endmodule
