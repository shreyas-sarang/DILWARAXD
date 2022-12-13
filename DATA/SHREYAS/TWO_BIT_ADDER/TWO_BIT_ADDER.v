// -------------------------------------------------------------
// 
// File Name: A:\internship\MATLAB\TWO_BIT_ADDER\TWO_BIT_ADDER\TWO_BIT_ADDER\TWO_BIT_ADDER.v
// Created: 2022-12-13 21:58:43
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
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: TWO_BIT_ADDER
// Source Path: TWO_BIT_ADDER/TWO_BIT_ADDER
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module TWO_BIT_ADDER
          (A,
           B,
           Y);


  input   [7:0] A;  // uint8
  input   [7:0] B;  // uint8
  output  [7:0] Y;  // uint8


  wire [7:0] Sum_out1;  // uint8


  assign Sum_out1 = A + B;



  assign Y = Sum_out1;

endmodule  // TWO_BIT_ADDER

