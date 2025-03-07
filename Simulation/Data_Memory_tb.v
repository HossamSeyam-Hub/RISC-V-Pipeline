`timescale 1ns / 1ps

module Data_Memory_tb();
    // 1) Declare local reg and wire identifiers with _tb suffix
    reg clk_tb = 0;               // The clock signal for testbench
    reg we_tb;                   // Write Enable signal for testbench
    reg [31:0] a_tb;             // Address  for testbench
    reg [31:0] wd_tb;            // Write Data for testbench
    wire [31:0] rd_tb;           // Read Data for testbench

    // 2) Instantiate the module under test
    Data_Memory uut (
        .clk(clk_tb),             
        .we(we_tb),               
        .a(a_tb),                  
        .wd(wd_tb),               
        .rd(rd_tb)                 
    );
    
    // 3) Generate stimuli, using initial and always
    // Clock generation
    always 
    begin
        #50 clk_tb = ~clk_tb;   
        
    end
    //Test Cases
    initial 
    begin
        a_tb = 32'h0;        wd_tb = 32'h0;       we_tb = 1;#80; 
        a_tb = 32'h4;        wd_tb = 32'h0;       we_tb = 1;#80; 
        a_tb = 32'h50;       wd_tb = 32'h0;       we_tb = 1;#80; 
        a_tb = 32'h1023;     wd_tb = 32'h0;       we_tb = 1;#80; 
        
        a_tb = 32'h0;     wd_tb = 32'hA5A5A5A5;       we_tb = 1;  #80;    
        a_tb = 32'h0;     wd_tb = 32'h12345678;       we_tb = 0;  #80;       
        
        a_tb = 32'h4;     wd_tb = 32'hABCDEF78;       we_tb = 1;  #80;    
        a_tb = 32'h4;     wd_tb = 32'hA5A5A5A5;       we_tb = 0;  #80; 
        
        a_tb = 32'h50;    wd_tb = 32'h12121212;       we_tb = 1;  #80;    
        a_tb = 32'h50;    wd_tb = 32'h12312312;       we_tb = 0;  #80; 
        
        a_tb = 32'h1023;  wd_tb = 32'hA1B2C3D4;       we_tb = 1;  #80;    
        a_tb = 32'h1023;  wd_tb = 32'h1A2B3C4D;       we_tb = 0;  #80; 
      
    end
endmodule
