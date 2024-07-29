module Top2( 
    input wire clk,
    input wire [1:0] SW,
    output wire LED,
    output wire [7:0] SEGMENT,
    output wire [3:0] AN
);

    wire[15:0] cnt;
    wire [3:0] Hex;
    wire clk_1s;

    /* module clk_100ms at submodules/clk_1s.v */
    clk_1s clk_div_1s (.clk(clk), .clk_1s(clk_1s));

    /* You need to implement module RevCounter */
    RevCounter counter(.clk(clk_1s), .rst(SW[1]), .s(SW[0]), .cnt(cnt), .Rc(LED));

    // Please replace module below with your module completed in Lab **7**
    // imoprt submodules for module DisplayNumber from your prev. project
    DisplayNumber display(.clk(clk), .rst(1'b0), .hexs(cnt), .LEs(4'b0000), .points(4'b0000), .AN(AN), .SEGMENT(SEGMENT));

endmodule
