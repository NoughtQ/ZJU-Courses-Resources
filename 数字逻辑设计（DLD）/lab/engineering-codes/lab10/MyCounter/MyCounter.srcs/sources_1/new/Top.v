module Top( 
    input wire clk,
    output wire LED,
    output wire [7:0] SEGMENT,
    output wire [3:0] AN
);

    wire Qa;
    wire Qb;
    wire Qc;
    wire Qd;
    wire [3:0] Hex;

    /* module clk_1s at submodules/clk_1s.v */
    clk_1s m0(.clk(clk), .clk_1s(clk_1s));

    /* You need to implement module Counter4b */
    Counter4b m1(.clk(clk_1s), .Qa(Qa), .Qb(Qb), .Qc(Qc), .Qd(Qd), .Rc(LED));

    assign Hex = {Qd, Qc, Qb, Qa};

    // Please replace module below with your module completed in Lab 6
    // Pay attention to the correctness of the module name and port name
    // NOTE: SEGMENT and Segement are different port names

    // BTN[0]: LE, valid with value 0
    // BTN[1]: point, light with value 1
    // SW[7:4]: AN, light with value 1(AN[i] = ~SW[i+4])
    // SW[3:0]: number to display
    DispNum display(.BTN(2'b00), .SW({4'b0001, Hex}), .SEGMENT(SEGMENT), .AN(AN));

endmodule
