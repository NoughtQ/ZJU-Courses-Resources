module Top(
        input wire clk,
        input wire [1:0] BTN,
        input wire [1:0] SW1,
        input wire [1:0] SW2,
        input wire [11:0] SW,
        output wire [3:0] AN,
        output wire [7:0] SEGMENT,
        output wire BTNX4,
        output wire seg_clk,
        output wire seg_clrn,
        output wire seg_sout,
        output wire SEG_PEN
);
    wire [15:0] num;
    wire [1:0] btn_out;
    wire [3:0] res;
    wire Co;
    wire [31:0] clk_div;
    wire [15:0] disp_hexs;
    wire [15:0] disp_hexs_my;

    assign disp_hexs[15:12] = num[7:4];            // B
    assign disp_hexs[11:8]  = num[3:0];            // A
    assign disp_hexs[7:4]   = {3'b000, Co};
    assign disp_hexs[3:0]   = res[3:0];                // C

    /* Code here */
    assign disp_hexs_my = (16'b0101011101000001); // Fill the last four digits of your student id in ()
    assign BTNX4 = 1'b0;

    clkdiv m2(.clk(clk), .rst(0), .div_res(clk_div));
    pbdebounce m0(.clk(clk_div[17]), .button(BTN[0]), .pbreg(btn_out[0]));
    pbdebounce m1(.clk(clk_div[17]), .button(BTN[1]), .pbreg(btn_out[1]));

    CreateNumber m3(.btn({2'b0, btn_out}), .sw({2'b0, SW1}), .num(num)); // Attachment

    // The ALU module you wrote
    ALU m5(    .A(num[3:0]), 
                    .B(num[7:4]),                             // fill sth. in ()
                    .op(SW2[1:0]),                             // fill sth. in ()
                    .res(res[3:0]),                             // fill sth. in ()
                    .Cout(Co)); 

    // Module you design in Lab7
    DisplayNumber m6(    .clk(clk), .hexs(disp_hexs), .LEs(4'b1111),         // fill sth. in ()
                                .points(SW[3:0]), .rst(1'b0),                             // fill sth. in ()
                                .AN(AN), .SEGMENT(SEGMENT));

    // Attachment
    SSeg_Dev m7(.clk(clk), .flash(clk_div[25]), .Hexs({disp_hexs_my, disp_hexs}), .LES(SW[11:4]),
                    .Point({4'b0000, SW[3:0]}), .rst(1'b0), .Start(clk_div[20]), .seg_clk(seg_clk),
                    .seg_clrn(seg_clrn), .SEG_PEN(SEG_PEN), .seg_sout(seg_sout));

endmodule
