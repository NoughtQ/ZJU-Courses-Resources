`timescale 1ns / 1ps

module CSRRegs(
    input clk, rst,
    input[11:0] raddr, waddr,
    input[31:0] wdata,
    input csr_w,
    input[1:0] csr_wsc_mode,
    input [31:0] mepc,
    input [31:0] mcause,
    input [31:0] mtval,
    input mret,
    input exception,
    input allow_interrupt,

    output[31:0] rdata,
    output[31:0] mstatus,
    output [31:0] mtvec,
    output [31:0] mepc_out
);

    reg[31:0] CSR [0:15];
    reg [1:0] privilege;    // to save current privilege

    // Address mapping. The address is 12 bits, but only 4 bits are used in this module.
    wire raddr_valid = raddr[11:7] == 5'h6 && raddr[5:3] == 3'h0;
    wire[3:0] raddr_map = (raddr[6] << 3) + raddr[2:0];
    wire waddr_valid = waddr[11:7] == 5'h6 && waddr[5:3] == 3'h0;
    wire[3:0] waddr_map = (waddr[6] << 3) + waddr[2:0];

    assign mstatus = CSR[0];

    assign rdata = CSR[raddr_map];

    always@(posedge clk or posedge rst) begin
        if (rst) begin
			CSR[0] <= 32'h88;
			CSR[1] <= 0;
			CSR[2] <= 0;
			CSR[3] <= 0;
			CSR[4] <= 32'hfff;
			CSR[5] <= 0;
			CSR[6] <= 0;
			CSR[7] <= 0;
			CSR[8] <= 0;
			CSR[9] <= 0;
			CSR[10] <= 0;
			CSR[11] <= 0;
			CSR[12] <= 0;
			CSR[13] <= 0;
			CSR[14] <= 0;
			CSR[15] <= 0;

            privilege <= 0;
		end
        else if(csr_w) begin
            case(csr_wsc_mode)
                2'b01: CSR[waddr_map] = wdata;
                2'b10: CSR[waddr_map] = CSR[waddr_map] | wdata;
                2'b11: CSR[waddr_map] = CSR[waddr_map] & ~wdata;
                default: CSR[waddr_map] = wdata;
            endcase            
        end else begin 
            // update CSR registers
            if (exception || allow_interrupt || mret) begin
                CSR[9] <= mepc;
                CSR[10] <= mcause;
                CSR[11] <= mtval;
            end
            // set mstatus
            if (exception || allow_interrupt) begin
                CSR[0][3] <= 0;               // MIE on 3rd bit
                CSR[0][7] <= CSR[0][3];       // MPIE on 7th bit
                CSR[0][12:11] <= privilege;   // MPP on 11-12th bit
                privilege <= CSR[0][12:11];
            end else if (mret) begin
                CSR[0][3] <= CSR[0][7];
                CSR[0][7] <= 1;
                CSR[0][12:11] <= 3;
                privilege <= CSR[0][12:11];
            end
        end
    end

    assign mtvec = CSR[5];
    assign mepc_out = CSR[9];

endmodule