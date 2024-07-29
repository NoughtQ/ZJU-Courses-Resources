`timescale 1ns / 1ps

module mux4to14b_sim();
// Inputs
    reg [1:0] S;
    reg [3:0] I0;
    reg [3:0] I1;
    reg [3:0] I2;
    reg [3:0] I3;
// Output
    wire [3:0] O;
    
    Mux4to1b4 test(
        .S(S),
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .O(O)
        );
// Initialize Inputs
    integer i, j;
    initial begin
        S=0;
        I0=0;
        I1=0;
        I2=0;
        I3=0;
    for(j=0;j<=3;j=j+1)begin
        S=j;
        I0=0;
        I1=0;
        I2=0;
        I3=0;
        for(i=0;i<=15;i=i+1)begin
            #50;
            if(j==0) I0 = i;
            else if(j==1) I1 = i;
            else if(j==2) I2 = i;
            else if(j==3) I3 = i;
        end
    end
    end
endmodule
