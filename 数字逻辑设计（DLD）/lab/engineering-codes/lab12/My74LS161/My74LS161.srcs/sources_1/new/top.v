module top(
    input clk,
    input [1:0] SW,
    output [3:0] AN,
    output [7:0] SEGMENT
);

    wire clk_10ms;
    wire clk_100ms;
    // clk_1s used in LabA
    clk_10ms clk_div_10ms (.clk(clk), .clk_10ms(clk_10ms)); // Refer to the code of clk_1s to complete these modules
    clk_100ms clk_div_100ms (.clk(clk), .clk_100ms(clk_100ms)); 

    wire clk_counter = (SW[0] == 1'b0) ? clk_10ms : clk_100ms; // Connect this clk_counter to CP-port of 74LS161

    wire [3:0] hour_tens;
    wire [3:0] hour_ones;
    wire [3:0] min_tens;
    wire [3:0] min_ones;

    // Your code here to get the correct HOUR and MINUTE
     wire [3:0] ht,ho,mt,mo;
     My74LS161 m1 
    (.CP(clk_counter),.CRn(1'b1),.LDn(~(min_ones[0]&min_ones[3])),.D(4'b0),.CTT(1'b1),.CTP(1'b
    1),.Q(min_ones));
     My74LS161 m2 
    (.CP(clk_counter),.CRn(1'b1),.LDn(~(min_tens[2]&min_tens[0]&min_ones[0]&min_ones[3])),
    .D(4'b0),.CTT(min_ones[0]&min_ones[3]),.CTP(1'b1),.Q(min_tens));
     My74LS161 m3 
    (.CP(clk_counter),.CRn(1'b1),.LDn(~(hour_tens[1]&hour_ones[2])),.D(4'b0),.CTT(min_tens[2]
    &min_tens[0]&min_ones[0]&min_ones[3]),.CTP(1'b1),.Q(hour_ones));
     My74LS161 m4 
    (.CP(clk_counter),.CRn(1'b1),.LDn(~(hour_tens[1]&hour_ones[2])),.D(4'b0),.CTT(hour_ones[0]&hour_ones[3]),
    .CTP(1'b1),.Q(hour_tens));
     
     assign mo = (1'b1 == SW[1]) ? 4'b0 : min_ones;
     assign mt = (1'b1 == SW[1]) ? 4'b0 : min_tens;
     assign ho = (1'b1 == SW[1]) ? 4'b0011 : hour_ones;
     assign ht = (1'b1 == SW[1]) ? 4'b0010 : hour_tens;

    // Module written in Lab 7
    DisplayNumber display_inst(.clk(clk), .hexs({hour_tens, hour_ones, min_tens, min_ones}), .points(4'b0100), .rst(1'b0), .LEs(4'b0000), .AN(AN), .SEGMENT(SEGMENT));

endmodule
