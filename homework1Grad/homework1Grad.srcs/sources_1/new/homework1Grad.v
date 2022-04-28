`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:19 08/30/2018 
// Design Name: 
// Module Name:    B200_state_machine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module state_machine(
    input clk,
    input reset,
    input X,
    output reg Y
    );


reg [1:0] state = 0;							
reg [1:0] nextstate = 0;

always @(posedge clk)
	begin
		if(reset)
			begin
				state <= 0;						// <= is reset of real flop with real clock edge
			end
		else
			state <= nextstate;				// <= is the actual setting of the state D-FF with real clock edge
	end

always @(*)										// determination of future state given circumstances at this instant
	begin
	      Y = 0;					// = is setting thing I have to remember for a while
		case (state)
			0:
				begin
					if (X == 0)
					 begin
						nextstate = 0;
						Y = 0;
					 end
					else
					 begin
						nextstate = 1;
						Y = 1;
					 end
				end
			1:
				begin
				    Y = 0;
					if (X == 0)
					 begin
						nextstate = 2;
					 end
					else
					 begin
						nextstate = 1;
					 end
				end
			2:
				begin
					if (X == 0)
					 begin
						nextstate = 2;
						Y = 0;
					 end
					else
					 begin
						nextstate = 3;
						Y = 1;
					 end
				end
			3:
				begin
				    Y = 0;
					if (X == 0)
					 begin
						nextstate = 3;
					 end
					else
					 begin
						nextstate = 0;
					 end
				end
		endcase
	end

endmodule
