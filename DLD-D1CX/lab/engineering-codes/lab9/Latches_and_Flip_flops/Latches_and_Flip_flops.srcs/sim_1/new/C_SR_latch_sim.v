`timescale 1ns / 1ps
module C_SR_latch_sim();
// Inputs
 reg R;
 reg S;
 reg C;
// Outputs
 wire Q;
 wire Qbar;
C_SR_latch CSR1(
 .R(R),
 .S(S),
 .C(C),
 .Q(Q),
 .Qbar(Qbar)
);
 initial begin
     C = 1'b1;
     R = 1'b1; S=1'b0; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b0; S=1'b1; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b1; S=1'b0; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b0; S=1'b1; #30;
     R = 1'b0; S=1'b0; #30;
     
     C = 1'b0; 
     R = 1'b1; S=1'b0; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b0; S=1'b1; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b1; S=1'b0; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b0; S=1'b1; #30;
     R = 1'b0; S=1'b0; #30;
     
     C = 1'b1;
     R = 1'b1; S=1'b0; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b0; S=1'b1; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b1; S=1'b0; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b0; S=1'b1; #30;
     R = 1'b0; S=1'b0; #30;
     
     C = 1'b0; 
     R = 1'b1; S=1'b0; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b0; S=1'b1; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b1; S=1'b0; #30;
     R = 1'b0; S=1'b0; #30;
     R = 1'b0; S=1'b1; #30;
     R = 1'b0; S=1'b0; #30;
 end
endmodule