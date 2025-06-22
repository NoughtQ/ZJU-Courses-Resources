`timescale 1ns / 1ps

module ExceptionUnit(
    input clk, rst,
    input csr_rw_in,
    input[1:0] csr_wsc_mode_in,
    input csr_w_imm_mux,
    input[11:0] csr_rw_addr_in,
    input[31:0] csr_w_data_reg,
    input[4:0] csr_w_data_imm,
    output[31:0] csr_r_data_out,

    input interrupt,
    input illegal_inst,
    input l_access_fault,
    input s_access_fault,
    input ecall_m,

    input mret,

    input[31:0] epc_cur,
    input[31:0] epc_next,
    output[31:0] PC_redirect,
    output redirect_mux,

    output reg_FD_flush, reg_DE_flush, reg_EM_flush, reg_MW_flush, 
    output RegWrite_cancel,

    input [31:0] addr,
    input [31:0] inst
);

    reg[11:0] csr_raddr, csr_waddr;
    reg[31:0] csr_wdata;
    reg csr_w;
    reg[1:0] csr_wsc;

    wire[31:0] mstatus;
    reg [31:0] mepc;
    wire [31:0] mepc_out;
    reg [31:0] mcause;
    reg [31:0] mtval;
    wire [31:0] mtvec;

    wire exception = illegal_inst || l_access_fault || s_access_fault || ecall_m;
    wire allow_interrupt = interrupt && mstatus[3];

    reg Reg_FD_flush;
    reg Reg_DE_flush;
    reg Reg_EM_flush;
    reg Reg_MW_flush;
    reg Reg_RegWrite_cancel;

    reg [31:0] reg_PC_redirect;
    reg reg_redirect_mux;

    CSRRegs csr(
        .clk(clk),
        .rst(rst),
        .csr_w(csr_w),
        .raddr(csr_raddr),
        .waddr(csr_waddr),
        .wdata(csr_wdata),
        .rdata(csr_r_data_out),
        .mstatus(mstatus),
        .csr_wsc_mode(csr_wsc),
        .mepc(mepc),
        .mcause(mcause),
        .mtval(mtval),
        .mret(mret),
        .exception(exception),
        .allow_interrupt(allow_interrupt),
        .mtvec(mtvec),
        .mepc_out(mepc_out)
);

    //According to the diagram, design the Exception Unit
    always @(*) begin   
        // reset  
        if (rst) begin
            csr_raddr = 0;
            csr_waddr = 0;
            csr_wdata = 0;
            csr_w = 0;
            csr_wsc = 0;

            mepc = 0;

            Reg_FD_flush = 0;
            Reg_DE_flush = 0;
            Reg_EM_flush = 0;
            Reg_MW_flush = 0;
            Reg_RegWrite_cancel = 0;
        end

        // csr instructions
        if (csr_rw_in) begin
            csr_raddr = csr_rw_addr_in;            // read
            if (csr_wsc_mode_in) begin             // write
                csr_waddr = csr_rw_addr_in;
                if (csr_w_imm_mux)                 // register or immediate
                    csr_wdata = csr_w_data_imm;
                else
                    csr_wdata = csr_w_data_reg;
                csr_w = 1;
                csr_wsc = csr_wsc_mode_in;             
            end else begin                         // not write  
                csr_waddr = 0;
                csr_wdata = 0;
                csr_w = 0;
                csr_wsc = 0;
            end
        end else begin                             // neither read nor write
            // csr_raddr = 0;
            csr_waddr = 0;
            csr_wdata = 0;
            csr_w = 0;
            csr_wsc = 0;
        end

        // mepc
        if (interrupt)
            mepc = epc_next;     // return to next instruction
        else if (exception)
            mepc = epc_cur;      // return to current instruction
        else
            mepc = mepc;         // nothing happen

        // mcause, mtval
        if (exception || allow_interrupt) begin
            reg_PC_redirect = mtvec;
            reg_redirect_mux = 1;

            // mtval
            if (illegal_inst)
                mtval = inst;
            else if (l_access_fault || s_access_fault)
                mtval = addr;
            else
                mtval = epc_cur;

            // mcause
            if (interrupt)                   // external interrupt
                mcause = 32'h8000000B;       
            else if (illegal_inst)           // illgeal instructon
                mcause = 2;                  
            else if (l_access_fault)         // load access out of boundary  
                mcause = 5;
            else if (s_access_fault)         // store access out of boundary
                mcause = 7;
            else if (ecall_m)                // ecall
                mcause = 11;

        end else if (mret) begin
            reg_PC_redirect = mepc_out;
            reg_redirect_mux = 1;
            mtval = 0;
            mcause = 0;
        end else begin
            reg_PC_redirect = 0;
            reg_redirect_mux = 0;
            mtval = 0;
            mcause = 0;
        end

        // flush
        if (allow_interrupt) begin
            Reg_FD_flush = 0;
            Reg_DE_flush = 0;
            Reg_EM_flush = 0;
            Reg_MW_flush = 0;
            Reg_RegWrite_cancel = 0;       
        end else if (exception || mret) begin
            Reg_FD_flush = 1;
            Reg_DE_flush = 1;
            Reg_EM_flush = 1;
            Reg_MW_flush = 1;
            Reg_RegWrite_cancel = 1;
        end else begin
            Reg_FD_flush = 0;
            Reg_DE_flush = 0;
            Reg_EM_flush = 0;
            Reg_MW_flush = 0;
            Reg_RegWrite_cancel = 0;
        end
    end

    assign reg_FD_flush = Reg_FD_flush;
    assign reg_DE_flush = Reg_DE_flush;
    assign reg_EM_flush = Reg_EM_flush;
    assign reg_MW_flush = Reg_MW_flush;
    assign RegWrite_cancel = Reg_RegWrite_cancel;

    assign PC_redirect = reg_PC_redirect;
    assign redirect_mux = reg_redirect_mux;

endmodule