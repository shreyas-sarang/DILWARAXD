// -------------------------------------------------------------
// 
// File Name: A:\internship\MATLAB\SEVEN_TAP_FILTER_USING_BLOCKS\SEVEN_TAP_FILTER_USING_BLOCKS\MUL.v
// Created: 2022-12-13 23:41:59
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: MUL
// Source Path: SEVEN_TAP_FILTER_USING_BLOCKS/SEVEN_TAP_FILTER_USING_BLOCKS/MUL
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

(* use_dsp48 = "yes" *)module MUL
          (X,
           h,
           Y);


  input   [7:0] X;  // uint8
  input   [7:0] h;  // uint8
  output  [7:0] Y;  // uint8


  wire [15:0] Product_mul_temp;  // ufix16
  wire [7:0] Product_out1;  // uint8


  assign Product_mul_temp = X * h;
  assign Product_out1 = Product_mul_temp[7:0];



  assign Y = Product_out1;

endmodule  // MUL

