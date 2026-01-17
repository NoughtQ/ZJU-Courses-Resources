`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:26:56 01/15/2021
// Design Name:   cache
// Module Name:   D:/files/ZJU3.1/Computer Architecture/Topic8/cache_sim.v
// Project Name:  Topic8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cache
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cache_sim;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] addr;
	reg load;
	reg store;
	reg edit;
	reg invalid;
	reg [2:0] u_b_h_w;
	reg [31:0] din;

	// Outputs
	wire hit;
	wire [31:0] dout;
	wire valid;
	wire dirty;
	wire [22:0] tag;

	// Instantiate the Unit Under Test (UUT)
	cache uut (
		.clk(~clk), 
		.rst(rst), 
		.addr(addr), 
		.load(load),
		.store(store), 
		.edit(edit), 
		.invalid(invalid), 
		.u_b_h_w(u_b_h_w),
		.din(din), 
		.hit(hit), 
		.dout(dout), 
		.valid(valid), 
		.dirty(dirty), 
		.tag(tag)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk ;
	end

	reg [31:0]counter = 0;

	always @(posedge clk) begin
		counter <= counter + 32'b1;

		case (counter)
			// Initialize Inputs
			32'd0: begin
				rst <= 0;
				addr <= 0;
				load <= 0;
				store <= 0;
				edit <= 0;
				invalid <= 0;
				u_b_h_w <= 0;
				din <= 0;
			end

			// init
			32'd10: begin
				load <= 0;
				store <= 1;
				edit <= 0;

				din <= 32'h11111111;
				addr <= 32'h00000004;
			end

			32'd11: begin
				addr <= 32'h0000000C;
			end

			32'd12: begin
				addr <= 32'h00000010;
			end

			32'd13: begin
				addr <= 32'h00000014;
			end

			// read miss
			32'd14: begin
				load <= 1;
				store <= 0;
				edit <= 0;

				u_b_h_w <= 3'b010;
				din <= 0;
				addr <= 32'h00000020;
			end

			// read hit
			32'd15: begin
				u_b_h_w <= 3'b010;
				addr <= 32'h00000010;
			end

			// write miss
			32'd16: begin
				load <= 0;
				store <= 0;
				edit <= 1;

				u_b_h_w <= 3'b010;
				din <= 32'h22222222;
				addr <= 32'h000000024;
			end

			// write hit
			32'd17: begin
				u_b_h_w <= 3'b010;
				addr <= 32'h00000014;
			end


			// read line 0 of set 0, set recent bit
			32'd18: begin
				load <= 1;
				store <= 0;
				edit <= 0;

				u_b_h_w <= 3'b010;
				din <= 0;
				addr <= 32'h00000004;
			end

			// store to line 1 of set 0 due to line 0 recent
			32'd19: begin
				load <= 0;
				store <= 1;
				edit <= 0;

				u_b_h_w <= 3'b010;
				din <= 32'h33333333;
				addr <= 32'h00000204;
			end

			// edit line 1 of set 0, set dirty & recent
			32'd20: begin
				load <= 0;
				store <= 0;
				edit <= 1;

				u_b_h_w <= 3'b010;
				din <= 32'h44444444;
				addr <= 32'h00000204;
			end

			// read line 0 of set 0, set recent bit
			32'd21: begin
				load <= 1;
				store <= 0;
				edit <= 0;

				u_b_h_w <= 3'b010;
				din <= 0;
				addr <= 32'h00000004;
			end

			// read miss, tag mismatch. output tag (of line 1), valid and dirty == 1
			32'd22: begin
				load <= 1;
				store <= 0;
				edit <= 0;
				
				u_b_h_w <= 3'b010;
				din <= 32'h0;
				addr <= 32'h00000404;
			end

			// auto replace line 1 of set 0
			32'd23: begin
				load <= 0;
				store <= 1;
				edit <= 0;

				u_b_h_w <= 3'b010;
				din <= 32'h55555555;
				addr <= 32'h00000404;
			end

			// clear
			default: begin
				load <= 0;
				store <= 0;
				edit <= 0;
				din <= 0;
				addr <= 0;
			end
		endcase
	end

	// initial begin
	// 	// Initialize Inputs
	// 	rst = 0;
	// 	addr = 0;
	// 	load = 0;
	// 	store = 0;
	// 	edit = 0;
	// 	invalid = 0;
	// 	din = 0;
        
	// 	// Add stimulus here
	// 	// init
	// 	#200;

	// 	store = 1;
	// 	din = 32'h11111111;
	// 	addr = 32'h00000004;
	// 	#20;

	// 	addr = 32'h0000000C;
	// 	#20;

	// 	addr = 32'h000000A8;
	// 	#20;

	// 	addr = 32'h0000001C;
	// 	#20;

	// 	// read miss
	// 	store = 0;
	// 	load = 1;
	// 	addr = 32'h000000B4;
	// 	din = 0;
	// 	#100;

	// 	// read hit
	// 	addr = 32'h000000A8;
	// 	#100;

	// 	// write miss
	// 	edit = 1;
	// 	load = 0;
	// 	din = 32'h22222222;
	// 	addr = 32'h000000038;
	// 	#100;

	// 	// write hit
	// 	addr = 32'h000000A8;
	// 	#100;

	// 	// clear
	// 	edit = 0;
	// 	din = 0;
	// 	addr = 0;
	// end
      
endmodule

