module FD(
    input clk,
    input D,
    output Q,
    output Qn
);

    reg Q_reg = 1'b0;
    always @(posedge clk) begin
        Q_reg <= D;    
    end

    assign Q = Q_reg;
    assign Qn = ~Q_reg;

endmodule
