// -------------------------------------------------------------
// 
// File Name: A:\internship\MATLAB\MUL\MUL\MUL.v
// Created: 2022-12-13 22:11:40
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
// Module: MUL
// Source Path: MUL/MUL
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module MUL
          (A,
           B,
           Y);


  input   [7:0] A;  // uint8
  input   [7:0] B;  // uint8
  output  [7:0] Y;  // uint8


  wire [15:0] Product_mul_temp;  // ufix16
  wire [7:0] Product_out1;  // uint8


  assign Product_mul_temp = A * B;
  assign Product_out1 = Product_mul_temp[7:0];



  assign Y = Product_out1;

endmodule  // MUL

