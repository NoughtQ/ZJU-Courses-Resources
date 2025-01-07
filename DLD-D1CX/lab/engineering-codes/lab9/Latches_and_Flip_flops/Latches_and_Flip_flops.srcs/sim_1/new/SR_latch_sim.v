`timescale 1ns / 1ps
module SR_latch_sim();
// Inputs
 reg R;
 reg S;
// Outputs
 wire Q;
 wire Qbar;
SR_latch SR1(
 .R(R),
 .S(S),
 .Q(Q),
 .Qbar(Qbar)
);
 initial begin
     R = 1'b1; S=1'b0; #50;
     R = 1'b0; S=1'b0; #50;
     R = 1'b0; S=1'b1; #50;
     R = 1'b0; S=1'b0; #50;
     R = 1'b1; S=1'b0; #50;
     R = 1'b0; S=1'b0; #50;
     R = 1'b0; S=1'b1; #50;
     R = 1'b0; S=1'b0; #50;
  end
endmodule