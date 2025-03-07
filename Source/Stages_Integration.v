`timescale 1ns / 1ps

module Stage_Integration(clk, rst, Stall_F, Flush_D, Stall_D,
                         Rs1_D_out, Rs2_D_out, Flush_E, Rs1_E_out, Rs2_E_out, Rd_E_out, PCSrc_E_out, ForwardA_E, ForwardB_E, ResultSrc_E_lsb, 
                         Rd_M_out, RegWrite_M_out, Rd_W_out, RegWrite_W_out);
        
        //Input Ports
        input wire clk, rst, Stall_F, Flush_D, Stall_D, Flush_E;
        input wire [1:0] ForwardA_E, ForwardB_E;
       
        //Output Ports
        output wire PCSrc_E_out, ResultSrc_E_lsb, RegWrite_M_out, RegWrite_W_out;
        output wire [4:0] Rs1_D_out, Rs2_D_out, Rs1_E_out, Rs2_E_out, Rd_E_out, Rd_M_out, Rd_W_out; 
         
        //Internal wires
        /*Fetch Stage Internal wires*/
         wire PCSrc_E;
         wire [31:0] PCTarget_E;
         wire [31:0] RD_F, PC_F, PCPlus4_F;
        /*Decode Stage Internal wires*/
         wire Regwrite_W;
         wire [4:0] Rd_W;
         wire [31:0] Instr_D, PC_D_in, PCPlus4_D_in, Result_W;
         wire RegWrite_D, MemWrite_D, Jump_D, Branch_D, ALUSrc_D, Funct3_lsb_D;    
         wire [1:0] ResultSrc_D;                               
         wire [2:0] ALUControl_D;                                                      
         wire [4:0] Rs1_D, Rs2_D, Rd_D;                                       
         wire [31:0] RD1_D, RD2_D, PC_D_out, ImmExt_D, PCPlus4_D_out;
        /*Execute Stage Internal wires*/
         wire RegWrite_E_in, MemWrite_E_in, Jump_E, Branch_E, ALUSrc_E, Funct3_lsb_E;    
         wire [1:0] ResultSrc_E_in;                               
         wire [2:0] ALUControl_E;                                                       
         wire [4:0] Rs1_E_in, Rs2_E_in, Rd_E_in;                                        
         wire [31:0] RD1_E, RD2_E, pc_E,ImmExt_E, pcplus4_E_in, ALUResult_M;                  
         wire RegWrite_E_out, MemWrite_E_out;                        
         wire [1:0] ResultSrc_E_out;                                                       
         wire [4:0] Rd_E_wire;                             
         wire [31:0] ALUResult_E, WriteData_E, pcplus4_E_out;                 
        /*Memory Stage Internal wires*/
         wire MemWriteM, RegWriteM_in;
         wire [1:0] ResultSrcM_in;
         wire [4:0] RdM_in, RdM_Wire;                                                  
         wire [31:0] WriteDataM, PCPlus4M_in;                             
         wire RegWriteM_out;
         wire [1:0] ResultSrcM_out;
         wire [31:0] ALUResultM_out, ReadDataM, PCPlus4M_out;
        /*WriteBack Stage Internal wires*/
         wire [1:0] ResultSrc_W;
         wire [31:0] ALUResult_W, ReadData_W, PCPlus4_W;
        
        //Blocks Instantiation
        Fetch_Stage FS(
                        .PCSrc_E(PCSrc_E), 
                        .PCTarget_E(PCTarget_E), 
                        .Stall_F(Stall_F), 
                        .clk(clk), 
                        .rst(rst),
                        .RD_F(RD_F), 
                        .PC_F(PC_F), 
                        .PCPlus4_F(PCPlus4_F)
                           );
        Fetch_Decode_Register FDR(
                        .Instr_F(RD_F), 
                        .pc_F(PC_F), 
                        .pcplus4_F(PCPlus4_F),
                        .Instr_D(Instr_D), 
                        .pc_D(PC_D_in), 
                        .pcplus4_D(PCPlus4_D_in),
                        .clk(clk), 
                        .Flush_D(Flush_D), 
                        .Stall_D(Stall_D)
                 ); 
                                  
        Decode_stage DS(
                        .Instr_D(Instr_D),
                        .PC_D_in(PC_D_in), 
                        .PCPlus4_D_in(PCPlus4_D_in), 
                        .Rd_W(Rd_W), 
                        .Result_W(Result_W), 
                        .Regwrite_W(Regwrite_W), 
                        .RegWrite_D(RegWrite_D), 
                        .ResultSrc_D(ResultSrc_D), 
                        .MemWrite_D(MemWrite_D), 
                        .Jump_D(Jump_D), 
                        .Branch_D(Branch_D), 
                        .ALUControl_D(ALUControl_D), 
                        .ALUSrc_D(ALUSrc_D), 
                        .Funct3_lsb_D(Funct3_lsb_D), 
                        .RD1_D(RD1_D), 
                        .RD2_D(RD2_D), 
                        .PC_D_out(PC_D_out), 
                        .ImmExt_D(ImmExt_D), 
                        .PCPlus4_D_out(PCPlus4_D_out), 
                        .Rs1_D(Rs1_D),
                        .Rs2_D(Rs2_D),
                        .Rd_D(Rd_D),
                        .clk(clk) 
                    );
        assign Rs1_D_out = Rs1_D;
        assign Rs2_D_out = Rs2_D;
       
        Decode_Execute_Register DER(
                        .RD1_D(RD1_D), 
                        .RD2_D(RD2_D), 
                        .pc_D(PC_D_out), 
                        .Rs1_D(Rs1_D), 
                        .Rs2_D(Rs2_D), 
                        .Rd_D(Rd_D), 
                        .ImmExt_D(ImmExt_D), 
                        .pcplus4_D(PCPlus4_D_out), 
                        .RegWrite_D(RegWrite_D), 
                        .ResultSrc_D(ResultSrc_D), 
                        .MemWrite_D(MemWrite_D), 
                        .Jump_D(Jump_D),
                        .Branch_D(Branch_D), 
                        .ALUControl_D(ALUControl_D), 
                        .ALUSrc_D(ALUSrc_D),
                        .Funct3_lsb_D(Funct3_lsb_D),
                        .RD1_E(RD1_E), 
                        .RD2_E(RD2_E), 
                        .pc_E(pc_E), 
                        .Rs1_E(Rs1_E_in), 
                        .Rs2_E(Rs2_E_in), 
                        .Rd_E(Rd_E_in), 
                        .ImmExt_E(ImmExt_E), 
                        .pcplus4_E(pcplus4_E_in), 
                        .RegWrite_E(RegWrite_E_in), 
                        .ResultSrc_E(ResultSrc_E_in), 
                        .MemWrite_E(MemWrite_E_in), 
                        .Jump_E(Jump_E), 
                        .Branch_E(Branch_E), 
                        .ALUControl_E(ALUControl_E), 
                        .ALUSrc_E(ALUSrc_E),
                        .Funct3_lsb_E(Funct3_lsb_E), 
                        .clk(clk), 
                        .Flush_E(Flush_E) 
                    );
        
        Execute_Stage EXS(
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
                        .Rd_E_out(Rd_E_wire), 
                        .ResultSrc_E_lsb(ResultSrc_E_lsb)
                  );
                            
        assign  Rd_E_out = Rd_E_wire;                                                                       
        assign  PCSrc_E_out = PCSrc_E;
        
        Execute_Memory_Register EMR(
                        .ALUResult_E(ALUResult_E), 
                        .WriteData_E(WriteData_E), 
                        .Rd_E(Rd_E_wire), 
                        .pcplus4_E(pcplus4_E_out), 
                        .RegWrite_E(RegWrite_E_out), 
                        .ResultSrc_E(ResultSrc_E_out), 
                        .MemWrite_E(MemWrite_E_out), 
                        .ALUResult_M(ALUResult_M), 
                        .WriteData_M(WriteDataM), 
                        .Rd_M(RdM_in), 
                        .pcplus4_M(PCPlus4M_in), 
                        .RegWrite_M(RegWriteM_in), 
                        .ResultSrc_M(ResultSrcM_in), 
                        .MemWrite_M(MemWriteM), 
                        .clk(clk) 
                );
             
       MEMORY_STAGE MS(
                        .RegWriteM_in(RegWriteM_in), 
                        .ResultSrcM_in(ResultSrcM_in),
                        .MemWriteM(MemWriteM), 
                        .ALUResultM_in(ALUResult_M), 
                        .WriteDataM(WriteDataM), 
                        .RdM_in(RdM_in), 
                        .PCPlus4M_in(PCPlus4M_in), 
                        .RegWriteM_out(RegWriteM_out), 
                        .ResultSrcM_out(ResultSrcM_out), 
                        .ALUResultM_out(ALUResultM_out), 
                        .ReadDataM(ReadDataM), 
                        .RdM_out(RdM_Wire), 
                        .PCPlus4M_out(PCPlus4M_out), 
                        .clk(clk)
                );
       
       assign Rd_M_out = RdM_Wire; 
       assign RegWrite_M_out = RegWriteM_out;
       
       Memory_Writeback_Register MWBR(
                        .ALUResult_M(ALUResultM_out), 
                        .RD_M(ReadDataM), 
                        .Rd_M(RdM_Wire), 
                        .pcplus4_M(PCPlus4M_out), 
                        .ResultSrc_M(ResultSrcM_out), 
                        .RegWrite_M(RegWriteM_out),
                        .ALUResult_W(ALUResult_W), 
                        .RD_W(ReadData_W), 
                        .Rd_W(Rd_W), 
                        .pcplus4_W(PCPlus4_W), 
                        .ResultSrc_W(ResultSrc_W), 
                        .RegWrite_W(Regwrite_W),
                        .clk(clk)
                );
       assign Rd_W_out =  Rd_W;
                               
       WriteBack_Stage WBS(
                        .RegWrite_W_in(Regwrite_W), 
                        .ResultSrc_W(ResultSrc_W), 
                        .ALUResult_W(ALUResult_W), 
                        .ReadData_W(ReadData_W), 
                        .PCPlus4_W(PCPlus4_W),
                        .RegWrite_W_out(RegWrite_W_out), 
                        .Result_W(Result_W)
                );

endmodule
