`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/08 13:59:17
// Design Name: 
// Module Name: cache_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cache_tb();
// Inputs
	reg clock;
	reg reset_n;
	reg [31:0] addr_cpu;
	reg rd_cpu;
	reg wr_cpu;
	reg ready_mem;

	// Outputs
	wire [31:0] addr_mem;
	wire rd_mem;
	wire wr_mem;
	wire stall_cpu;

	// Bidirs
	wire [31:0] data_cpu;
	wire [31:0] data_mem;
	
	reg [31:0] dcpu;
	reg [31:0] wcpu;
	reg [31:0] dmem;
	reg [31:0] wmem;
	
	// Instantiate the Unit Under Test (UUT)
	cache uut (
		.clock(clock), 
		.reset_n(reset_n), 
		.data_cpu(data_cpu), 
		.data_mem(data_mem), 
		.addr_cpu(addr_cpu), 
		.addr_mem(addr_mem), 
		.rd_cpu(rd_cpu), 
		.wr_cpu(wr_cpu), 
		.rd_mem(rd_mem), 
		.wr_mem(wr_mem), 
		.stall_cpu(stall_cpu), 
		.ready_mem(ready_mem)
	);

	assign data_cpu = wr_cpu? wcpu : 32'dZ;
	assign data_mem = !wr_mem? dmem : 32'dZ;

	//Clock generator block
	initial begin
	clock = 1'd0;
	forever
	#10 clock = ~clock;
	end
	
	task delay;
	begin
	@(negedge clock);
	end
	endtask		
		
	
	initial begin
		// Initialize Inputs
		reset_n = 0;
		addr_cpu = 0;
		rd_cpu = 0;
		wr_cpu = 0;
		ready_mem = 1;
		wcpu = 0;
		
		repeat(4)
		delay;
		
		reset_n = 1;
		
		delay;
		delay;
		//  Read from location
		rd_cpu = 1'd1;
		addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_0111;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd1;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd0;
		delay;
		delay;
		//  Write to same location
		wr_cpu = 1'd1;
		wcpu = 32'habababab;
		addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_0111;
		delay;
		delay;
		wr_cpu = 1'd0;
		delay;
		delay;
		// Read from same location to check updated data
		rd_cpu = 1'd1;
		addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_0111;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd1;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd0;
		delay;
		
//		 Read Miss with dirty bit 0 policy check, reads data from Main Memory
		
		delay;
		rd_cpu = 1'd1;
		addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_1010;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd1;
		dcpu = data_cpu;
		@(posedge rd_mem);
		ready_mem = 0;
		repeat(4)
		delay;
		
		ready_mem = 1;
		
		delay;
		
		dmem = 32'h11111111;
		
		delay;
		
		dmem = 32'h22222222;
		
		delay;
		
		dmem = 32'h33333333;
		
		delay;
		
		dmem = 32'h44444444;
		
		delay;
		
		delay;
		
		delay;
		
		delay;
		
		rd_cpu = 1'd0;
		
		delay;
		delay;
		rd_cpu = 1'd1;
        addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_1010;
        delay;
        delay;
        delay;
 		rd_cpu = 1'd0;

//////////////////////////////////////////////////////
		//  write Miss with dirty bit 0 policy check
		delay;
		delay;
		wr_cpu = 1'd1;
		wcpu = 32'h5a5a5a5a;
		addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_1101;
		delay;
		wr_cpu = 1'd1;
//		delay;
//		delay;
//		@(posedge wr_mem);
//		ready_mem = 0;
//		repeat(4)
//		delay;
		
//		ready_mem = 1;
		
		@(posedge rd_mem);
		ready_mem = 0;
		repeat(4)
		delay;
		
		ready_mem = 1;
		
		delay;
		
		dmem = 32'hAAAAAAAA;
		
		delay;
		
		dmem = 32'hBBBBBBBB;
		
		delay;
		
		dmem = 32'hCCCCCCCC;
		
		delay;
		
		dmem = 32'hDDDDDDDD;
		
		delay;
		
		delay;
		
		delay;
		
		delay;
		wr_cpu = 1'd0;
        delay;
        delay;
        delay;
		//write the same address again
		wr_cpu = 1'd1;
        wcpu = 32'h5a5a5a5a;
        addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_1101;
        
        delay;                   
        
        delay;
        
        wr_cpu = 1'd0;
        delay;
        delay;
        // Read from same location to check updated data
        rd_cpu = 1'd1;
        addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_1101;
        dcpu = data_cpu;
        delay;
        rd_cpu = 1'd1;
        dcpu = data_cpu;
        delay;
        rd_cpu = 1'd0;
        delay;
		
		repeat(10)
		delay;
		
		
		// End of Simulation
		#300 $finish;

	end
      
endmodule
