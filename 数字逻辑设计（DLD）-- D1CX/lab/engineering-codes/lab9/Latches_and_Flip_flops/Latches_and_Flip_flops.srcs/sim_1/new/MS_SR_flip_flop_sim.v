`timescale 1ns / 1ps

module MS_SR_flip_flop_sim();
// Inputs
  reg S;
  reg clk;
  reg R;
// Outputs
  wire mid_Q;
  wire Q;
  wire Qbar;
  // Instantiate the Unit Under Test (UUT)
  MS_SR_flip_flop uut(
    .S(S), 
    .clk(clk), 
    .R(R), 
    .mid_Q(mid_Q), 
    .Q(Q), 
    .Qbar(Qbar)
  );
  initial begin
  // Initialize Inputs
    S = 0;
    clk = 0;
    R = 0;
    S=0;R=0;#25;S=1;R=0;#25;
    S=0;R=1;#100;S=1;R=0;#100;
    S=0;R=0;#100;S=0;R=1;#100;
    S=1;R=1;#100;S=0;R=0;#100;
    S=1;R=0;#10;
    S=0;#5;R=1;#10;
    S=0;R=0;#25;R=1;#5;
    R=0;#5;S=0;R=0;#40;
    S=1;#10;S=0;#50;
    R=1;#10;R=0;
  end

 always begin
    clk=0;#50;
    clk=1;#50;
 end
endmodule