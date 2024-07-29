`timescale 1ns / 1ps
module C_D_latch_sim();
// Inputs
  reg D;
  reg C;
// Outputs
  wire Q;
  wire Qbar;
// Instantiate the Unit Under Test (UUT)
C_D_latch uut(
.D(D), 
.C(C), 
.Q(Q), 
.Qbar(Qbar)
);
  initial begin
// Initialize Inputs
    D = 0;
    C = 0;
    C=1;D=1; #50;
    D=0; #50;
    D=1;#50;
    D=0;#50;
    D=1;#50;
    C=0;D=1; #50;
    D=0;
  end
 
endmodule