`timescale 1ns / 1ps

module Execute_Stage_tb();

    // Inputs
    reg RegWrite_E_in, MemWrite_E_in, Jump_E, Branch_E, ALUSrc_E, Funct3_lsb_E;
    reg [1:0] ResultSrc_E_in, ForwardA_E, ForwardB_E;
    reg [2:0] ALUControl_E;
    reg [4:0] Rs1_E_in, Rs2_E_in, Rd_E_in;
    reg [31:0] RD1_E, RD2_E, pc_E, ImmExt_E, pcplus4_E_in, Result_W, ALUResult_M;

    // Outputs
    wire PCSrc_E, RegWrite_E_out, MemWrite_E_out, ResultSrc_E_lsb;
    wire [1:0] ResultSrc_E_out;
    wire [4:0] Rs1_E_out, Rs2_E_out, Rd_E_out;
    wire [31:0] ALUResult_E, WriteData_E, pcplus4_E_out, PCTarget_E;

    // Instantiate the Execute_Stage module
    Execute_Stage DUT (
        .RegWrite_E_in(RegWrite_E_in),
        .ResultSrc_E_in(ResultSrc_E_in),
        .MemWrite_E_in(MemWrite_E_in),
        .Jump_E(Jump_E),
        .Branch_E(Branch_E),
        .ALUControl_E(ALUControl_E),
        .ALUSrc_E(ALUSrc_E),
        .Funct3_lsb_E(Funct3_lsb_E),
        .RD1_E(RD1_E),
        .RD2_E(RD2_E),
        .pc_E(pc_E),
        .Rs1_E_in(Rs1_E_in),
        .Rs2_E_in(Rs2_E_in),
        .Rd_E_in(Rd_E_in),
        .ImmExt_E(ImmExt_E),
        .pcplus4_E_in(pcplus4_E_in),
        .Result_W(Result_W),
        .ForwardA_E(ForwardA_E),
        .ForwardB_E(ForwardB_E),
        .ALUResult_M(ALUResult_M),
        .PCSrc_E(PCSrc_E),
        .RegWrite_E_out(RegWrite_E_out),
        .ResultSrc_E_out(ResultSrc_E_out),
        .MemWrite_E_out(MemWrite_E_out),
        .ALUResult_E(ALUResult_E),
        .WriteData_E(WriteData_E),
        .pcplus4_E_out(pcplus4_E_out),
        .PCTarget_E(PCTarget_E),
        .Rs1_E_out(Rs1_E_out),
        .Rs2_E_out(Rs2_E_out),
        .Rd_E_out(Rd_E_out),
        .ResultSrc_E_lsb(ResultSrc_E_lsb)
    );

    // Testbench process
    initial begin
        // Initialize Inputs
        RegWrite_E_in = 0;
        ResultSrc_E_in = 2'b00;
        MemWrite_E_in = 0;
        Jump_E = 0;
        Branch_E = 0;
        ALUControl_E = 3'b000;
        ALUSrc_E = 0;
        Funct3_lsb_E = 0;
        RD1_E = 32'h00000000;
        RD2_E = 32'h00000000;
        pc_E = 32'h00000000;
        Rs1_E_in = 5'b00000;
        Rs2_E_in = 5'b00000;
        Rd_E_in = 5'b00000;
        ImmExt_E = 32'h00000000;
        pcplus4_E_in = 32'h00000000;
        Result_W = 32'h00000000;
        ForwardA_E = 2'b00;
        ForwardB_E = 2'b00;
        ALUResult_M = 32'h00000000;

        // Apply test cases
        #10 RegWrite_E_in = 1;
            MemWrite_E_in = 1;
            ALUControl_E = 3'b010;
            RD1_E = 32'h00000010;
            RD2_E = 32'h00000020;
            ImmExt_E = 32'h00000004;
            ALUSrc_E = 1;
            ForwardA_E = 2'b01;
            ForwardB_E = 2'b10;

        #10 Jump_E = 1;
            Branch_E = 1;
            Funct3_lsb_E = 1;

        #10 ALUControl_E = 3'b110;
            RD1_E = 32'hA0000000;
            RD2_E = 32'h0000000F;

        #10 $finish;
    end

endmodule
