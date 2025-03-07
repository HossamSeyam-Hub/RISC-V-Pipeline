`timescale 1ns / 1ps

module Register_File(
    input  clk, WE3,
    input  [4:0] A1, A2, A3,
    input  [31:0] WD3,
    output [31:0] RD1, RD2
    );

    reg [31:0] RF [0:31];
    
    initial 
    begin
        RF[0] = 32'b0; 
    end
    
    always @(negedge clk) begin
        if (WE3 && A3 != 5'b00000)
            RF[A3] <= WD3;   
    end

    assign RD1 = RF[A1];
    assign RD2 = RF[A2];

endmodule
