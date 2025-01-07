// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Mar  5 10:53:44 2024
// Host        : LAPTOP-6G31RL0V running 64-bit major release  (build 9200)
// Command     : write_verilog -mode synth_stub E:/FPGA/ip/DataPath.v
// Design      : DataPath
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module DataPath(clk, rst, inst_field, Data_in, ALU_Control, ImmSel, 
  MemtoReg, ALUSrc_B, Jump, Branch, RegWrite, PC_out, Data_out, ALU_out)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,inst_field[31:0],Data_in[31:0],ALU_Control[2:0],ImmSel[1:0],MemtoReg[1:0],ALUSrc_B,Jump,Branch,RegWrite,PC_out[31:0],Data_out[31:0],ALU_out[31:0]" */;
  input clk;
  input rst;
  input [31:0]inst_field;
  input [31:0]Data_in;
  input [2:0]ALU_Control;
  input [1:0]ImmSel;
  input [1:0]MemtoReg;
  input ALUSrc_B;
  input Jump;
  input Branch;
  input RegWrite;
  output [31:0]PC_out;
  output [31:0]Data_out;
  output [31:0]ALU_out;
endmodule
