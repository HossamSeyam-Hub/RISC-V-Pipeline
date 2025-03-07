`timescale 1ns / 1ps

module Execute_Stage(RegWrite_E_in, ResultSrc_E_in, MemWrite_E_in, Jump_E, Branch_E, ALUControl_E, ALUSrc_E, Funct3_lsb_E, RD1_E, RD2_E, pc_E, Rs1_E_in, Rs2_E_in, Rd_E_in, ImmExt_E, pcplus4_E_in, Result_W, ForwardA_E, ForwardB_E, ALUResult_M,
                     PCSrc_E, RegWrite_E_out, ResultSrc_E_out, MemWrite_E_out, ALUResult_E, WriteData_E, pcplus4_E_out, PCTarget_E, Rs1_E_out, Rs2_E_out, Rd_E_out, ResultSrc_E_lsb
                     );
                     
       //Input Ports
       input wire RegWrite_E_in, MemWrite_E_in, Jump_E, Branch_E, ALUSrc_E, Funct3_lsb_E ;    
       input wire [1:0] ResultSrc_E_in, ForwardA_E, ForwardB_E;                               
       input wire [2:0] ALUControl_E;                                                       
       input wire [4:0] Rs1_E_in, Rs2_E_in, Rd_E_in;                                        
       input wire [31:0] RD1_E, RD2_E, pc_E,ImmExt_E, pcplus4_E_in, Result_W, ALUResult_M;                  
       
       //Output Ports
       output wire PCSrc_E, RegWrite_E_out, MemWrite_E_out, ResultSrc_E_lsb;                        
       output wire [1:0] ResultSrc_E_out;                                                       
       output wire [4:0] Rs1_E_out, Rs2_E_out, Rd_E_out;                             
       output wire [31:0] ALUResult_E, WriteData_E, pcplus4_E_out, PCTarget_E;                 
       
       //Internal wires
       wire Zero_E;                                                                 
       wire [31:0] SrcA_E, SrcB_E, WriteData_E_wire;            
       
       //Stage blocks insantiation  
       PCSrc_E_Generator B1 (
                    .Zero_E(Zero_E), 
                    .Jump_E(Jump_E), 
                    .Branch_E(Branch_E), 
                    .Funct3_lsb_E(Funct3_lsb_E), 
                    .PCSrc_E(PCSrc_E)
                );
       
       Forward_Mux_A B2 (
                    .RD1_E(RD1_E), 
                    .Result_W(Result_W), 
                    .ALUResult_M(ALUResult_M), 
                    .ForwardA_E(ForwardA_E), 
                    .SrcA_E(SrcA_E)
                );
       
       Forward_Mux_B B3 (
                    .RD2_E(RD2_E), 
                    .Result_W(Result_W), 
                    .ALUResult_M(ALUResult_M), 
                    .ForwardB_E(ForwardB_E), 
                    .SrcB_E(WriteData_E_wire)
                );
       
       ALUINPUTMUX B4 (
                    .reg_data(WriteData_E_wire),
                    .ImmExx(ImmExt_E),
                    .alu_src(ALUSrc_E),
                    .SrcB(SrcB_E)
               );
       
       ALU B5 (
                    .SrcA(SrcA_E), 
                    .SrcB(SrcB_E), 
                    .ALUControl(ALUControl_E), 
                    .ALUResult(ALUResult_E), 
                    .Zero(Zero_E)
               );
       
       Adder_Target B6 (
                    .PC(pc_E), 
                    .ImmExt(ImmExt_E), 
                    .PCTarget(PCTarget_E)
               );
       
     //Internal Connections
      assign RegWrite_E_out = RegWrite_E_in;
      assign ResultSrc_E_out = ResultSrc_E_in;
      assign MemWrite_E_out = MemWrite_E_in;
      
      assign Rs1_E_out = Rs1_E_in;
      assign Rs2_E_out = Rs2_E_in; 
      assign Rd_E_out = Rd_E_in;
      
      assign ResultSrc_E_lsb = ResultSrc_E_in[0];   /* Least significant bit of ResultSrc_E*/
      assign WriteData_E = WriteData_E_wire;
      assign pcplus4_E_out = pcplus4_E_in;
           
endmodule
