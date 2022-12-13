// -------------------------------------------------------------
// 
// File Name: A:\internship\MATLAB\BLOCK_SEVEN_TAP_FILTER\BLOCK_SEVEN_TAP_FILTER\TWO_BIT_ADDER5.v
// Created: 2022-12-13 23:58:48
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: TWO_BIT_ADDER5
// Source Path: BLOCK_SEVEN_TAP_FILTER/BLOCK_SEVEN_TAP_FILTER/TWO_BIT_ADDER5
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module TWO_BIT_ADDER5
          (A,
           B,
           Y);


  input   [7:0] A;  // uint8
  input   [7:0] B;  // uint8
  output  [7:0] Y;  // uint8


  wire [7:0] Sum_out1;  // uint8


  assign Sum_out1 = A + B;



  assign Y = Sum_out1;

endmodule  // TWO_BIT_ADDER5

