/** module RevCounter
  * input
    *   clk: A clock signal driven by module clk_1s.
    *   s: 0 for increment, 1 for decrement
    * output
    *   cnt: a 16-bits register
    *   Rc: rise when the counter reset(i.e. carry will be set), that is, Rc becomes 1 when
    *           increment(s=0 & cnt=F) or decrement(s=1, cnt=0)
 */
//! NOTE: DO NOT CHANGE THE MODULE NAME & PORT NAMES
module RevCounter( 
 input wire clk,
 input wire rst,
 input wire s,
 output reg [15:0] cnt = 0,
 output wire Rc
);
 
     always @(posedge clk) begin
        if (rst == 1'b1) begin
            cnt <= 16'h0; 
        end
        else begin
            if (s == 1'b0) begin
                cnt <= (cnt == 16'hFFFF) ? 16'h0 : cnt + 1;
            end
            else begin
                cnt <= (cnt == 16'h0) ? 16'hFFFF : cnt - 1; 
            end
        end
     end
     assign Rc = (s == 1'b0) ? (cnt == 16'hFFFF) : (cnt == 16'h0);
endmodule