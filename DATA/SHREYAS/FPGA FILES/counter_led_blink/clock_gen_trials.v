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
	 output reg [7:0] op
	 );
	reg [7:0] num [7:0];
	reg [34:0] counter;
	reg [2:0] i;
	initial begin
	counter = 35'd0;
	num[0] = 8'b10000000;
	num[1] = 8'b01000000;
	num[2] = 8'b00100000;
	num[3] = 8'b00010000;
	num[4] = 8'b00001000;
	num[5] = 8'b00000100;
	num[6] = 8'b00000010;
	num[7] = 8'b00000001;
	end
	
	always @(posedge clk)
	begin
		counter = counter + 1'd1;
		if (counter == 35'd20000000)
		begin 
			counter = 35'd0;
			op = num [i];
			i = i + 1'b1;
		end
	end
endmodule
