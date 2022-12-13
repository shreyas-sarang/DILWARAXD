// -------------------------------------------------------------
// 
// File Name: A:\internship\MATLAB\TWO_BIT_ADDER\TWO_BIT_ADDER\TWO_BIT_ADDER\TWO_BIT_ADDER_testbench.v
// Created: 2022-12-13 21:59:05
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
// Module: TWO_BIT_ADDER_testbench
// Source Path: 
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module TWO_BIT_ADDER_testbench;



  reg  clk;
  reg  reset;
  wire enb;
  wire Y_done;  // ufix1
  wire rdEnb;
  wire Y_done_enb;  // ufix1
  reg [3:0] Y_addr;  // ufix4
  wire Y_active;  // ufix1
  reg  check1_done;  // ufix1
  wire snkDonen;
  wire resetn;
  wire tb_enb;
  reg  tb_enb_delay;
  wire ce_out;
  wire Y_enb;  // ufix1
  wire Y_lastAddr;  // ufix1
  wire [7:0] rawData_A;  // uint8
  reg [7:0] holdData_A;  // uint8
  wire [7:0] rawData_B;  // uint8
  reg [7:0] holdData_B;  // uint8
  reg [7:0] A_offset;  // uint8
  wire [7:0] A_1;  // uint8
  reg [7:0] B_offset;  // uint8
  wire [7:0] B_1;  // uint8
  wire [7:0] Y;  // uint8
  wire [7:0] Y_expected_1;  // uint8
  wire [7:0] Y_ref;  // uint8
  reg  Y_testFailure;  // ufix1
  wire testFailure;  // ufix1

  function real absReal(input real num);
  begin
    if (num < 0)
      absReal = -num;
    else
      absReal = num;
  end
  endfunction

  function real floatHalfToReal;
  input [15:0] x;
  reg [63:0] conv;

  begin
    conv[63] = x[15]; // sign 
    if (x[14:10] == 5'b0) // exp 
      conv[62:52] = 11'b0; 
    else
      conv[62:52] = 1023 + (x[14:10] - 15);
    conv[51:42] = x[9:0]; // mantissa 
    conv[41:0] = 42'b0;
    if (((x[14:10] == 5'h1F) && (x[9:0] != 10'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatHalfToReal = $bitstoreal(conv);
  end
  endfunction

  function real floatSingleToReal;
  input [31:0] x;
  reg [63:0] conv;

  begin
    conv[63] = x[31]; // sign 
    if (x[30:23] == 8'b0) // exp 
      conv[62:52] = 11'b0; 
    else
      conv[62:52] = 1023 + (x[30:23] - 127);
    conv[51:29] = x[22:0]; // mantissa 
    conv[28:0] = 29'b0;
    if (((x[30:23] == 8'hFF) && (x[22:0] != 23'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatSingleToReal = $bitstoreal(conv);
  end
  endfunction

  function real floatDoubleToReal;
  input [63:0] x;
  reg [63:0] conv;

  begin
    conv[63:0] = x[63:0]; 
    if (((x[62:52] == 11'h7FF) && (x[51:0] != 52'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatDoubleToReal = $bitstoreal(conv);
  end
  endfunction

  function isFloatEpsEqual(input real a, input real b, input real eps);
  real absdiff;

  begin
    absdiff = absReal(a - b);
    if (absdiff < eps) // absolute error check 
      isFloatEpsEqual = 1;
    else if (a == b) // check infinities 
      isFloatEpsEqual = 1; 
    else if (a*b == 0.0) // either is zero 
      isFloatEpsEqual = (absdiff < eps);
    else if (absReal(a) < absReal(b)) // relative error check
      isFloatEpsEqual = absdiff/absReal(b) < eps;
    else
      isFloatEpsEqual = absdiff/absReal(a) < eps;
  end
  endfunction
  function isFloatHalfEpsEqual;
  input [15:0] x;
  input [15:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatHalfToReal(x);
    b = floatHalfToReal(y);
    isFloatHalfEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction
  function isFloatSingleEpsEqual;
  input [31:0] x;
  input [31:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatSingleToReal(x);
    b = floatSingleToReal(y);
    isFloatSingleEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction
  function isFloatDoubleEpsEqual;
  input [63:0] x;
  input [63:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatDoubleToReal(x);
    b = floatDoubleToReal(y);
    isFloatDoubleEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction

  assign Y_done_enb = Y_done & rdEnb;



  assign Y_active = Y_addr != 4'b1010;



  assign #2 enb = rdEnb;

  assign snkDonen =  ~ check1_done;



  always 
    begin : clk_gen
      clk <= 1'b1;
      # (5);
      clk <= 1'b0;
      # (5);
      if (check1_done == 1'b1) begin
        clk <= 1'b1;
        # (5);
        clk <= 1'b0;
        # (5);
        $stop;
      end
    end

  initial
    begin : reset_gen
      reset <= 1'b1;
      # (20);
      @ (posedge clk)
      # (2);
      reset <= 1'b0;
    end

  assign resetn =  ~ reset;



  assign tb_enb = resetn & snkDonen;



  // Delay inside enable generation: register depth 1
  always @(posedge clk or posedge reset)
    begin : u_enable_delay
      if (reset) begin
        tb_enb_delay <= 0;
      end
      else begin
        tb_enb_delay <= tb_enb;
      end
    end

  assign rdEnb = (check1_done == 1'b0 ? tb_enb_delay :
              1'b0);



  assign ce_out = enb & (rdEnb & tb_enb_delay);



  assign Y_enb = ce_out & Y_active;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 10
  always @(posedge clk or posedge reset)
    begin : c_2_process
      if (reset == 1'b1) begin
        Y_addr <= 4'b0000;
      end
      else begin
        if (Y_enb) begin
          if (Y_addr >= 4'b1010) begin
            Y_addr <= 4'b0000;
          end
          else begin
            Y_addr <= Y_addr + 4'b0001;
          end
        end
      end
    end



  assign Y_lastAddr = Y_addr >= 4'b1010;



  assign Y_done = Y_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk or posedge reset)
    begin : checkDone_1
      if (reset) begin
        check1_done <= 0;
      end
      else begin
        if (Y_done_enb) begin
          check1_done <= Y_done;
        end
      end
    end

  // Data source for A
  assign rawData_A = 8'b00000001;



  // holdData reg for Constant_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Constant_out1
      if (reset) begin
        holdData_A <= 8'bx;
      end
      else begin
        holdData_A <= rawData_A;
      end
    end

  // Data source for B
  assign rawData_B = 8'b00000001;



  // holdData reg for Constant1_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Constant1_out1
      if (reset) begin
        holdData_B <= 8'bx;
      end
      else begin
        holdData_B <= rawData_B;
      end
    end

  always @(rawData_A or rdEnb)
    begin : stimuli_Constant_out1_1
      if (rdEnb == 1'b0) begin
        A_offset <= holdData_A;
      end
      else begin
        A_offset <= rawData_A;
      end
    end

  assign #2 A_1 = A_offset;

  always @(rawData_B or rdEnb)
    begin : stimuli_Constant1_out1_1
      if (rdEnb == 1'b0) begin
        B_offset <= holdData_B;
      end
      else begin
        B_offset <= rawData_B;
      end
    end

  assign #2 B_1 = B_offset;

  TWO_BIT_ADDER u_TWO_BIT_ADDER (.A(A_1),  // uint8
                                 .B(B_1),  // uint8
                                 .Y(Y)  // uint8
                                 );

  // Data source for Y_expected
  assign Y_expected_1 = 8'b00000010;



  assign Y_ref = Y_expected_1;

  always @(posedge clk or posedge reset)
    begin : Y_checker
      if (reset == 1'b1) begin
        Y_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && Y !== Y_ref) begin
          Y_testFailure <= 1'b1;
          $display("ERROR in Y at time %t : Expected '%h' Actual '%h'", $time, Y_ref, Y);
        end
      end
    end

  assign testFailure = Y_testFailure;

  always @(posedge clk)
    begin : completed_msg
      if (check1_done == 1'b1) begin
        if (testFailure == 1'b0) begin
          $display("**************TEST COMPLETED (PASSED)**************");
        end
        else begin
          $display("**************TEST COMPLETED (FAILED)**************");
        end
      end
    end

endmodule  // TWO_BIT_ADDER_testbench

