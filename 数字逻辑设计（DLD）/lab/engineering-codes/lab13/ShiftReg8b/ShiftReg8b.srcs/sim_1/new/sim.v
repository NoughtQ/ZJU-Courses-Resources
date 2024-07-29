`timescale 1ns / 1ps
module sim();
    // Inputs
    reg clk;
    reg shiftn_loadp;
    reg shift_in;
    reg [7:0] par_in;
    // Output
    wire [7:0] Q;
    // Instantiate the UUT
ShiftReg8b ShiftReg8b_tb_inst(
.clk(clk),
.shiftn_loadp(shiftn_loadp),
.shift_in(shift_in),
.par_in(par_in),
.Q(Q)
);
    initial begin
        clk = 0;
        assign shift_in = 1;
        par_in = 8'b10101011;
        assign shift_in = 1;
        shiftn_loadp = 1;
        #20;
        shiftn_loadp = 0;
        #20;
        par_in = 8'b00000010;
        shiftn_loadp = 1;
        shift_in = 0;
        #20;
        shiftn_loadp = 0;
        #90;
    end
    always begin
        clk <= ~clk;
        #10;
    end
endmodule