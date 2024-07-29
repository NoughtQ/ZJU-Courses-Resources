/*
Module Name: CreateNumber
Description:
To change the value printed on Arduino using btns.
You will get a initial value printed as the para. INIT_HEXES defined.
After each pression on btn, a number will increase by 1.

This new module can handle i-1 when signal sw is 1
*/

module CreateNumber#(
parameter INIT_HEXES = 16'b1010_1011_1100_1101 // Init with "AbCd"
) (
input[3:0] btn,
input[3:0] sw,
output reg[15:0] num
);
wire[3:0] A, B, C, D;

initial num <= INIT_HEXES;

// D(the next num[3:0]) is always greater than current num[3:0] by 1
AddSub4b a0(.A(num[15:12]), .B(4'b0001), .Ctrl(sw[3]), .S(A));
AddSub4b a1(.A(num[11: 8]), .B(4'b0001), .Ctrl(sw[2]), .S(B));
AddSub4b a2(.A(num[ 7: 4]), .B(4'b0001), .Ctrl(sw[1]), .S(C));
AddSub4b a3(.A(num[ 3: 0]), .B(4'b0001), .Ctrl(sw[0]), .S(D));

// When pressing btn[0] num[3:0]++
always @(posedge btn[3]) num[15:12] <= A;
always @(posedge btn[2]) num[11: 8] <= B;
always @(posedge btn[1]) num[ 7: 4] <= C;
always @(posedge btn[0]) num[ 3: 0] <= D;

endmodule
