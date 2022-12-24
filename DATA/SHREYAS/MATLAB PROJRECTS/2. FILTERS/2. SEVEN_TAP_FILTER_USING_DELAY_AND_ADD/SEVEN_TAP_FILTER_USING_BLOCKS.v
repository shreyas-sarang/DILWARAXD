// -------------------------------------------------------------
// 
// File Name: A:\internship\MATLAB\SEVEN_TAP_FILTER_USING_BLOCKS\SEVEN_TAP_FILTER_USING_BLOCKS\SEVEN_TAP_FILTER_USING_BLOCKS.v
// Created: 2022-12-13 23:41:59
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
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: SEVEN_TAP_FILTER_USING_BLOCKS
// Source Path: SEVEN_TAP_FILTER_USING_BLOCKS/SEVEN_TAP_FILTER_USING_BLOCKS
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module SEVEN_TAP_FILTER_USING_BLOCKS
          (clk,
           reset,
           clk_enable,
           h0,
           h1,
           h2,
           h3,
           h4,
           h5,
           h6,
           X,
           ce_out,
           Y);


  input   clk;
  input   reset;
  input   clk_enable;
  input   [7:0] h0;  // uint8
  input   [7:0] h1;  // uint8
  input   [7:0] h2;  // uint8
  input   [7:0] h3;  // uint8
  input   [7:0] h4;  // uint8
  input   [7:0] h5;  // uint8
  input   [7:0] h6;  // uint8
  input   [7:0] X;  // uint8
  output  ce_out;
  output  [7:0] Y;  // uint8


  wire [7:0] MUL_out1;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK_out1;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK_out2;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK1_out1;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK1_out2;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK2_out1;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK2_out2;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK3_out1;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK3_out2;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK4_out1;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK4_out2;  // uint8
  wire [7:0] DELAY_AND_ADD_BLOCK5_out1;  // uint8


  MUL u_MUL (.X(X),  // uint8
             .h(h0),  // uint8
             .Y(MUL_out1)  // uint8
             );

  DELAY_AND_ADD_BLOCK u_DELAY_AND_ADD_BLOCK (.clk(clk),
                                             .reset(reset),
                                             .enb(clk_enable),
                                             .X(X),  // uint8
                                             .h(h1),  // uint8
                                             .Previous(MUL_out1),  // uint8
                                             .Delayed(DELAY_AND_ADD_BLOCK_out1),  // uint8
                                             .Y(DELAY_AND_ADD_BLOCK_out2)  // uint8
                                             );

  DELAY_AND_ADD_BLOCK1 u_DELAY_AND_ADD_BLOCK1 (.clk(clk),
                                               .reset(reset),
                                               .enb(clk_enable),
                                               .X(DELAY_AND_ADD_BLOCK_out1),  // uint8
                                               .h(h2),  // uint8
                                               .Previous(DELAY_AND_ADD_BLOCK_out2),  // uint8
                                               .Delayed(DELAY_AND_ADD_BLOCK1_out1),  // uint8
                                               .Y(DELAY_AND_ADD_BLOCK1_out2)  // uint8
                                               );

  DELAY_AND_ADD_BLOCK2 u_DELAY_AND_ADD_BLOCK2 (.clk(clk),
                                               .reset(reset),
                                               .enb(clk_enable),
                                               .X(DELAY_AND_ADD_BLOCK1_out1),  // uint8
                                               .h(h3),  // uint8
                                               .Previous(DELAY_AND_ADD_BLOCK1_out2),  // uint8
                                               .Delayed(DELAY_AND_ADD_BLOCK2_out1),  // uint8
                                               .Y(DELAY_AND_ADD_BLOCK2_out2)  // uint8
                                               );

  DELAY_AND_ADD_BLOCK3 u_DELAY_AND_ADD_BLOCK3 (.clk(clk),
                                               .reset(reset),
                                               .enb(clk_enable),
                                               .X(DELAY_AND_ADD_BLOCK2_out1),  // uint8
                                               .h(h4),  // uint8
                                               .Previous(DELAY_AND_ADD_BLOCK2_out2),  // uint8
                                               .Delayed(DELAY_AND_ADD_BLOCK3_out1),  // uint8
                                               .Y(DELAY_AND_ADD_BLOCK3_out2)  // uint8
                                               );

  DELAY_AND_ADD_BLOCK4 u_DELAY_AND_ADD_BLOCK4 (.clk(clk),
                                               .reset(reset),
                                               .enb(clk_enable),
                                               .X(DELAY_AND_ADD_BLOCK3_out1),  // uint8
                                               .h(h5),  // uint8
                                               .Previous(DELAY_AND_ADD_BLOCK3_out2),  // uint8
                                               .Delayed(DELAY_AND_ADD_BLOCK4_out1),  // uint8
                                               .Y(DELAY_AND_ADD_BLOCK4_out2)  // uint8
                                               );

  DELAY_AND_ADD_BLOCK5 u_DELAY_AND_ADD_BLOCK5 (.clk(clk),
                                               .reset(reset),
                                               .enb(clk_enable),
                                               .X(DELAY_AND_ADD_BLOCK4_out1),  // uint8
                                               .h(h6),  // uint8
                                               .Previous(DELAY_AND_ADD_BLOCK4_out2),  // uint8
                                               .Y(DELAY_AND_ADD_BLOCK5_out1)  // uint8
                                               );

  assign Y = DELAY_AND_ADD_BLOCK5_out1;

  assign ce_out = clk_enable;

endmodule  // SEVEN_TAP_FILTER_USING_BLOCKS

