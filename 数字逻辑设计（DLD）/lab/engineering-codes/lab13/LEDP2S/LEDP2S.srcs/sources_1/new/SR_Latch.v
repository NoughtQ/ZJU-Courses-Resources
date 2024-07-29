module SR_Latch(
    input S,
    input R,
    output Q,
    output Qn
);

    reg Q_reg = 1'b0;

    always @(*) begin
        if(!S && R) Q_reg = 1'b0;
        else if(S && !R) Q_reg = 1'b1;
    end

    assign Q = Q_reg;
    assign Qn = ~Q_reg;

endmodule
