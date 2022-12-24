`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:48 12/23/2022 
// Design Name: 
// Module Name:    clock_gen 
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
module clock_gen(
	input clk,
	output reg new_clk
    );
	reg [34:0] counter;
	
	initial begin
	counter = 35'd0;
	new_clk = 1'd0;
	end
	
	always @(posedge clk)
	begin
		counter = counter +1'd1;
		if (counter == 35'd50000000)
		begin
			counter = 35'd0;
			new_clk = new_clk+1'd1;
		end
	end
endmodule