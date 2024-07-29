module CreateNumber(
    input [3:0]         btn,
    output reg [15:0]   num
);

    wire [3:0] A, B, C, D;

    initial num <= 16'b1010_1011_1100_1101;

    assign A = num[15:12] + 4'b1;
    assign B = num[11: 8] + 4'b1;
    assign C = num[ 7: 4] + 4'b1;
    assign D = num[ 3: 0] + 4'b1;

    always @(posedge btn[0]) num[15:12] <= A;
    always @(posedge btn[1]) num[11: 8] <= B;
    always @(posedge btn[2]) num[ 7: 4] <= C;
    always @(posedge btn[3]) num[ 3: 0] <= D;

endmodule
