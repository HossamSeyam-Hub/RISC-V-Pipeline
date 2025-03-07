`timescale 1ns / 1ps

module Decode_stage(Instr_D, PC_D_in, PCPlus4_D_in, Rd_W, Result_W, Regwrite_W, /*Stage Inputs*/
                    RegWrite_D, ResultSrc_D, MemWrite_D, Jump_D, Branch_D, ALUControl_D, ALUSrc_D, Funct3_lsb_D, RD1_D, RD2_D, PC_D_out, ImmExt_D, PCPlus4_D_out, Rs1_D, Rs2_D,Rd_D,/*Stage Outputs*/ 
                    clk );

    //Input Ports
    input wire Regwrite_W, clk;
    input wire [4:0] Rd_W;
    input wire [31:0] Instr_D, PC_D_in, PCPlus4_D_in, Result_W;
    
    //Output Ports
    output wire RegWrite_D, MemWrite_D, Jump_D, Branch_D, ALUSrc_D, Funct3_lsb_D;    
    output wire [1:0] ResultSrc_D;                               
    output wire [2:0] ALUControl_D;                                                      
    output wire [4:0] Rs1_D, Rs2_D, Rd_D;                                       
    output wire [31:0] RD1_D, RD2_D, PC_D_out, ImmExt_D, PCPlus4_D_out;
    
    //Internal wires

    wire [1:0] ImmSrc_D;

    //Blocks Instantiation
    Controller U0    (
             .Instr(Instr_D),
             .MemWrite(MemWrite_D),
             .RegWrite(RegWrite_D),
             .ImmSrc(ImmSrc_D),
             .ALUSrc(ALUSrc_D),
             .ALUControl(ALUControl_D),
             .ResultSrc(ResultSrc_D),
             .Jump(Jump_D),
             .Branch(Branch_D)     
    );
    
    Register_File U1 (
              .clk(clk),
              .WE3(Regwrite_W),
	          .A1(Instr_D[19:15]),
	          .A2(Instr_D[24:20]),
	          .A3(Rd_W),
              .WD3(Result_W),
	          .RD1(RD1_D),
	          .RD2(RD2_D)
         );
                      
    Extend_Unit U2(
              .instr(Instr_D[31:7]),          
              .immsrc(ImmSrc_D),          
              .immext(ImmExt_D)
         );
    
    assign Rs1_D = Instr_D[19:15];
    assign Rs2_D = Instr_D[24:20];  
    assign Rd_D =  Instr_D[11:7];
    assign Funct3_lsb_D = Instr_D[12];
    assign PC_D_out = PC_D_in;
    assign PCPlus4_D_out = PCPlus4_D_in;
   
    
endmodule
