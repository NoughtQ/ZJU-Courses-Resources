`timescale 1ns / 1ps
module sim();
    // Inputs
    reg clk;
    reg start; 
    reg [6:0] par_in;
    // Output
    wire sclk;
    wire sclrn;
    wire sout;
    wire EN;
    // Instantiate the UUT
P2S P2S_inst(
    .clk(clk),
    .start(start),
    .par_in(par_in),
    .sclk(sclk),
    .sclrn(sclrn),
    .sout(sout),
    .EN(EN)
);
    initial begin
        start = 0;
        clk = 0;
        par_in = 7'b0101011;
        #250
        start = 1;
        #1;
        start = 0;
        #1;
        #125;
        #125;
        par_in = 7'b1010101;
        #250;
        start = 1;
        #1;
        start = 0;
        #1;
    end
    always begin
        clk <= ~clk;
        #5;
    end
endmodule