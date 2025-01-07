module ShiftReg8b(
    input       clk,
    input       shiftn_loadp,
    input       shift_in,
    input [7:0] par_in,
    output[7:0] Q
);
    wire cons;
    wire [7:0] Qn;
    wire [7:0] D;
    genvar k; // Used in generate block
    generate
        for(k = 7; k < 8; k = k + 1) begin
            Inputgate Inputgate_else(.Dat(shift_in), .par_in(par_in[k]), .SL(shiftn_loadp), .D(D[k]));
        end
    endgenerate
    genvar i; // Used in generate block
    generate
        for(i = 0; i < 7; i = i + 1) begin
            Inputgate Inputgate_else(.Dat(Q[i + 1]), .par_in(par_in[i]), .SL(shiftn_loadp), .D(D[i]));
        end
    endgenerate
    genvar j;
    generate
        for(j = 0; j < 8; j = j + 1) begin
            FD FD1(.clk(clk), .D(D[j]), .Q(Q[j]), .Qn(Qn[j]));
        end
    endgenerate
endmodule