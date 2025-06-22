`timescale 1ps/1ps

module HazardDetectionUnit(
    input clk,
    input Branch_ID, rs1use_ID, rs2use_ID,
    input[1:0] hazard_optype_ID,
    input[4:0] rd_EXE, rd_MEM, rs1_ID, rs2_ID, rs2_EXE,
    output PC_EN_IF, reg_FD_EN, reg_FD_stall, reg_FD_flush,
        reg_DE_EN, reg_DE_flush, reg_EM_EN, reg_EM_flush, reg_MW_EN,
    output forward_ctrl_ls,
    output[1:0] forward_ctrl_A, forward_ctrl_B
);

    // according to the diagram, design the Hazard Detection Unit
    parameter hazard_ALU = 2'b01;
    parameter hazard_load = 2'b10;
    parameter hazard_store = 2'b11;

    reg [1:0] hazard_optype_EX, hazard_optype_MEM;
    reg [1:0] forward_A, forward_B;

    // Get other hazard optype from pipeline registers
    always @(posedge clk) begin
        hazard_optype_EX <= ~{2{reg_DE_flush}} & hazard_optype_ID;
        hazard_optype_MEM <= hazard_optype_EX;
    end

    // Stalling
    wire stall = (hazard_optype_EX == hazard_load) && rd_EXE && 
                 ((rs1use_ID && rs1_ID == rd_EXE) ||
                 (rs2use_ID && rs2_ID == rd_EXE && hazard_optype_ID != hazard_store));

    // Forwarding
    always @(*) begin
        forward_A = 0;
        forward_B = 0;
        if (hazard_optype_EX == hazard_ALU && rd_EXE) begin
            if (rs1use_ID && rs1_ID == rd_EXE) begin
                forward_A = 2'b01;
                forward_B = 0;
            end 
            if (rs2use_ID && rs2_ID == rd_EXE) begin
                forward_A = 0;
                forward_B = 2'b01;
            end
        end else if (hazard_optype_MEM == hazard_ALU && rd_MEM) begin
            if (rs1use_ID && rs1_ID == rd_MEM) begin
                forward_A = 2'b10;
                forward_B = 0;
            end
            if (rs2use_ID && rs2_ID == rd_MEM) begin
                forward_A = 0;
                forward_B = 2'b10;
            end
        end else if (hazard_optype_MEM == hazard_load && rd_MEM) begin
            if (rs1use_ID && rs1_ID == rd_MEM) begin
                forward_A = 2'b11;
                forward_B = 0;
            end
            if (rs2use_ID && rs2_ID == rd_MEM) begin
                forward_A = 0;
                forward_B = 2'b11;
            end
        end else begin
            forward_A = 0;
            forward_B = 0;
        end
    end

    // Outputs
    assign PC_EN_IF = ~stall;
    assign reg_FD_EN = 1'b1;
    assign reg_FD_stall = stall;
    assign reg_FD_flush = Branch_ID;
    assign reg_DE_EN = 1'b1;
    assign reg_DE_flush = stall;
    assign reg_EM_EN = 1'b1;
    assign reg_EM_flush = 1'b0;
    assign reg_MW_EN = 1'b1;
    // store the same register after load
    assign forward_ctrl_ls = (hazard_optype_EX == hazard_store) &&
                             (hazard_optype_MEM == hazard_load) &&
                             (rs2_EXE == rd_MEM);
    assign forward_ctrl_A = forward_A;
    assign forward_ctrl_B = forward_B;

endmodule