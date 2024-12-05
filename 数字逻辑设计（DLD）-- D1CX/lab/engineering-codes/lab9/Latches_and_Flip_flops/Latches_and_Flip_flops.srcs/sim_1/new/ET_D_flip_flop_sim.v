`timescale 1ns / 1ps

module ET_D_flip_flop_sim();
// Inputs
 reg D;
 reg clk;
// Outputs
 wire Q;
 wire Qbar;

ET_D_flip_flop ET_D_flip_flop_inst(
 .D(D),
 .clk(clk),
 .Q(Q),
 .Qbar(Qbar)
);

 initial begin
     D=0;
     clk=0; #50;
     clk=1; #50;
     D=1;
     clk=0; #50;
     clk=1; #50;
     D=0;
     clk=0; #50;
     clk=1; #50;
     D=1;
     clk=0; #50;
     clk=1; #50;
     D=0;
     clk=0; #50;
     clk=1; #50;
     D=1;
     clk=0; #50;
     clk=1; #50;
     D=0;
     clk=0; #50;
     clk=1; #50;
     D=1;
     clk=0; #50;
     clk=1; #50;
   end
endmodule