// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Feb 28 14:38:46 2024
// Host        : LAPTOP-6G31RL0V running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/clk_div.v
// Design      : clk_div
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_div(clk, rst, SW2, SW8, STEP, clkdiv, Clk_CPU)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,SW2,SW8,STEP,clkdiv[31:0],Clk_CPU" */;
  input clk;
  input rst;
  input SW2;
  input SW8;
  input STEP;
  output [31:0]clkdiv;
  output Clk_CPU;
endmodule
