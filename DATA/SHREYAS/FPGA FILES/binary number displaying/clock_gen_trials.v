`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:44 12/23/2022 
// Design Name: 
// Module Name:    clock_gen_trials 
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
module clock_gen_trials(
    input clk,
	 output reg new_clk, reg [3:0] num
	 );
	reg [34:0] counter;
	initial begin
	new_clk = 1'd0;
	counter = 35'd0;
	num = 4'd0;
	end
	
	always @(posedge clk)
	begin
		counter = counter + 1'd1;
		if (counter == 35'd200000000)
		begin 
			counter = 35'd0;
			new_clk = new_clk+ 1'd1;
			num = num +1'd1;
		end
	end
endmodule
