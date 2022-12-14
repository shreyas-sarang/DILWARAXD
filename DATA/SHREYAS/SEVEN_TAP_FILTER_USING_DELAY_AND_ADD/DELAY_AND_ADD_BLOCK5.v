// -------------------------------------------------------------
// 
// File Name: A:\internship\MATLAB\SEVEN_TAP_FILTER_USING_BLOCKS\SEVEN_TAP_FILTER_USING_BLOCKS\DELAY_AND_ADD_BLOCK5.v
// Created: 2022-12-13 23:41:59
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: DELAY_AND_ADD_BLOCK5
// Source Path: SEVEN_TAP_FILTER_USING_BLOCKS/SEVEN_TAP_FILTER_USING_BLOCKS/DELAY_AND_ADD_BLOCK5
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

(* use_dsp48 = "yes" *)module DELAY_AND_ADD_BLOCK5
          (clk,
           reset,
           enb,
           X,
           h,
           Previous,
           Y);


  input   clk;
  input   reset;
  input   enb;
  input   [7:0] X;  // uint8
  input   [7:0] h;  // uint8
  input   [7:0] Previous;  // uint8
  output  [7:0] Y;  // uint8


  reg [7:0] Delay_out1;  // uint8
  wire [15:0] Product_out1;  // uint16
  wire [7:0] Sum_add_cast;  // ufix8
  wire [7:0] Sum_out1;  // uint8


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

endmodule  // DELAY_AND_ADD_BLOCK5

