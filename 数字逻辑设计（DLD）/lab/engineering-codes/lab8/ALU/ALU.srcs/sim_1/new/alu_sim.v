`timescale 1ns / 1ps

module alu_sim();
    // Inputs
     reg [3:0] A;
     reg [3:0] B;
     reg [1:0] op;
    // Outputs
     wire [3:0] res;
     wire Cout;

ALU alu_inst(
 .A(A),
 .B(B),
 .op(op),
 .res(res),
 .Cout(Cout)
);
     initial begin
         op = 2'b00; A = 4'b1100; B = 4'b0011; #50;
         A = 4'b1111; B = 4'b1111; #50;
         op = 2'b01; A = 4'b1100; B = 4'b11; #50;
         A = 4'b0011; B = 4'b1100; #50;
         op = 2'b10; A = 4'b0011; B = 4'b0110; #50;
         A = 4'b1110; B = 4'b0011; #50;
         op = 2'b11; A = 4'b0011; B = 4'b0110; #50;
         A = 4'b1110; B = 4'b0011; #50;
     end
     
endmodule