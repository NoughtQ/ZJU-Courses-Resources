`timescale 1ns / 1ps
module counter4b_sim;
    // Inputs
    reg clk;
    // Outputs
    wire Qa;
    wire Qb;
    wire Qc;
    wire Qd;
    wire Rc;
// Instantiate the Unit Under Test (UUT)
Counter4b uut (
.Qa(Qa), 
.Qb(Qb), 
.Qc(Qc), 
.Qd(Qd), 
.Rc(Rc), 
.clk(clk)
);
    initial begin
    // Initialize Inputs
        clk = 0;
        #100;
    end
     always begin
        clk=clk^1;
        #10;
    end
endmodule