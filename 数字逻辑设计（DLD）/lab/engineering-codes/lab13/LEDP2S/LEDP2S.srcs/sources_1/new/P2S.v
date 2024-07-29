module P2S
#(parameter BIT_WIDTH = 7)(
    input clk,
    input start,
    input[BIT_WIDTH-1:0] par_in,
    output sclk,
    output sclrn,
    output sout,
    output EN
);
    wire[BIT_WIDTH:0] Q;
    wire Qn;
    wire S;
    wire q;
    wire Qn;
    wire consone;
    wire finish;
    
    assign S = start & finish;
    assign R = ~finish;
    assign consone = 1'b1;
    
    SR_Latch SR_Latch_1(.S(S), .R(R), .Q(q), .Qn(Qn));
    ShiftReg8b ShiftReg_1(.clk(clk), .shiftn_loadp(q), .shift_in(consone), .par_in({1'b0, 
    par_in[6:0]}), .Q(Q[7:0]));
    assign finish = Q[7] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6];
    assign EN = !start && finish;
    assign sclk = finish | clk;
    assign sclrn = 1'b1;
    assign sout = Q[0];
endmodule