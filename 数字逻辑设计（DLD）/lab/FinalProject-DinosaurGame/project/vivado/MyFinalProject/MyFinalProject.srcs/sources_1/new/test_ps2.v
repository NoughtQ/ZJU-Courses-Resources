module test_ps2(
    input wire clk,
    input ps2_clk,
    input ps2_data,
    input [0:0] SW,
    output wire [3:0] AN,
    output wire [7:0] SEGMENT,
    output reg [7:0] LED
);

    reg [15:0] data_out;
    wire up, down;
    wire [4:0] keyCode;
    wire keyReady;
    
    ps2 m0(
         .clk(clk),
         .rst(SW[0]),
         .ps2_clk(ps2_clk),
         .ps2_data(ps2_data), 
         .up(up),
         .down(down)
     );

    always @(posedge clk) begin
        if (up == 1) begin
            data_out <= 16'h1001;
            LED <= 8'b11000011;
        end
        else if (down == 1) begin
            data_out <= 16'h0110;
            LED <= 8'b00111100;
        end
        else begin
            data_out <= 16'h0;
            LED <= 8'b00000000;
        end
    end

    DisplayNumber m1( .clk(clk), 
         .hexs({data_out[15:0]}), 
         .LEs(4'b0), 
         .points(4'b0), 
         .rst(1'b0), 
         .AN(AN), 
         .SEGMENT(SEGMENT)
    );
    
endmodule