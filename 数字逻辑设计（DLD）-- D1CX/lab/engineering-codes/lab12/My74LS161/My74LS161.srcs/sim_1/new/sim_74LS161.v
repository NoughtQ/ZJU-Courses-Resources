`timescale 1ns / 1ps
module sim_74LS161();
    // Inputs
    reg CP;
    reg CRn;
    reg LDn;
    reg [3:0] D;
    reg CTT;
    reg CTP;
    // Output
    wire [3:0] Q;
    wire CO;
    // Instantiate the UUT
    My74LS161 My74LS161_inst (
    .CP(CP),
    .CRn(CRn),
    .LDn(LDn),
    .D(D),
    .CTT(CTT),
    .CTP(CTP),
    .Q(Q),
    .CO(CO)
    );
    integer i;
    initial begin
     assign LDn = 1;
     assign D = 4'b0000;
     CRn = 1;
     for(i = 0; i < 30; i = i + 1)begin
         CTT = 1'b1;
         CTP = 1'b1;
         CP = 1; #10;
         CP = 0; #10;
     end
     CRn = 0;#2;
     CRn = 1;
     for(i = 0; i < 2; i = i + 1)begin
         CTT = 1'b1;
         CTP = 1'b1;
         CP = 1; #10;
         CP = 0; #10;
     end
     for(i = 0; i < 2; i = i + 1)begin
         CTT = 1'b1;
         CTP = 1'b0;
         CP = 1; #10;
         CP = 0; #10;
     end
     for(i = 0; i < 2; i = i + 1)begin
         CTT = 1'b0;
         CTP = 1'b0;
         CP = 1; #10;
         CP = 0; #10;
     end
    end
endmodule