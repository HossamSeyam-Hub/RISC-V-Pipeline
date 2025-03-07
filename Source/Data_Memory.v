`timescale 1ns / 1ps

module Data_Memory(clk, we, a, wd, rd);

    input wire clk;
    input wire we;           // Write enable
    input wire [31:0] a;    // Address input
    input wire [31:0] wd;   // Write data input
    output reg [31:0] rd;   // Read data output

    // Memory declaration
    reg [31:0] RAM [63:0];

    // Continuous assignment for read data
    always @(*) begin
        rd = RAM[a[31:2]];  // Word-aligned read
    end

    // Write to memory
    always @(posedge clk) begin
        if (we) begin
            RAM[a[31:2]] <= wd;
        end
    end
endmodule


