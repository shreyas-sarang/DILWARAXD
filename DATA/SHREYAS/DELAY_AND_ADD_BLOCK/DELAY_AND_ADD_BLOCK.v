// -------------------------------------------------------------
// 
// File Name: A:\internship\MATLAB\DELAY_AND_ADD_BLOCK\DELAY_AND_ADD_BLOCK\DELAY_AND_ADD_BLOCK.v
// Created: 2022-12-13 22:40:33
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// Y                             ce_out        1
// Delayed                       ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: DELAY_AND_ADD_BLOCK
// Source Path: DELAY_AND_ADD_BLOCK/DELAY_AND_ADD_BLOCK
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module DELAY_AND_ADD_BLOCK
          (clk,
           reset,
           clk_enable,
           X,
           h,
           Previous,
           ce_out,
           Y,
           Delayed);


  input   clk;
  input   reset;
  input   clk_enable;
  input   [7:0] X;  // uint8
  input   [7:0] h;  // uint8
  input   [7:0] Previous;  // uint8
  output  ce_out;
  output  [7:0] Y;  // uint8
  output  [7:0] Delayed;  // uint8


  wire enb;
  reg [7:0] Delay_out1;  // uint8
  wire [15:0] Product_out1;  // uint16
  wire [7:0] Sum_add_cast;  // ufix8
  wire [7:0] Sum_out1;  // uint8


  assign enb = clk_enable;

  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay_out1 <= X;
        end
      end
    end



  assign Product_out1 = Delay_out1 * h;



  assign Sum_add_cast = Product_out1[7:0];
  assign Sum_out1 = Sum_add_cast + Previous;



  assign Y = Sum_out1;

  assign Delayed = Delay_out1;

  assign ce_out = clk_enable;

endmodule  // DELAY_AND_ADD_BLOCK
