module Top( 
 input wire clk, 
 input wire [4:0]SW, 
 input wire [1:0]BTN_Y, 
 output wire [3:0]AN, 
 output wire [7:0]LED, 
 output wire BTN_X, 
 output wire [7:0]SEGMENT 
 ); 
 
     wire clk_1,S_IN; 
     wire [7:0]num; 
     wire [31:0]clk_div; 
     wire [1:0]btn_out; 
     assign S_IN=(SW[4]==0)?SW[3]:LED[0]; 
     assign BTN_X=0; 
     clk_1s m0(clk,clk_1); 
     clkdiv m1(clk,0,clk_div); 
     CreateNumber m2(btn_out[1:0],num); 
     ShiftReg8b m3(.clk(clk_1),.shiftn_loadp(SW[2]), .shift_in(S_IN), .par_in(num), .Q(LED)); 
     DisplayNumber m4(.clk(clk), .hexs({num[7:0],LED}), .points(4'b1), .LEs(4'b0), .rst(1'b0),.AN(AN),.SEGMENT(SEGMENT)); 
     pbdebounce m5(clk_div[17],BTN_Y[0],btn_out[0]); 
     pbdebounce m6(clk_div[17],BTN_Y[1],btn_out[1]); 
 
endmodule