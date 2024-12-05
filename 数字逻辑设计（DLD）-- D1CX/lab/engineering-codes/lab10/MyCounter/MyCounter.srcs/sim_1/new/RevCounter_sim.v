`timescale 1ns / 1ps
module RevCounter_sim();
    // Inputs
    reg clk;
    reg rst;
    reg s;
    // Output
    wire Rc;
    wire [15:0] cnt;
    // Instantiate the UUT
RevCounter RevCounter_inst (
.clk(clk),
.rst(rst),
.s(s),
.Rc(Rc),
.cnt(cnt)
);
    integer i;
    initial begin
     rst = 0;
     s = 0;
     for(i=0;i<4;i=i+1)begin
        clk=1;#10;
        clk=0;#10;
     end
     rst = 1;
     for(i=0;i<2;i=i+1)begin
        clk=1;#10;
        clk=0;#10;
     end
     rst = 0;
     s = 1;
     for(i=0;i<4;i=i+1)begin
        clk=1;#10;
        clk=0;#10;
     end
     rst = 1;
     for(i=0;i<2;i=i+1)begin
        clk=1;#10;
        clk=0;#10;
     end
     rst = 0;
    end
endmodule