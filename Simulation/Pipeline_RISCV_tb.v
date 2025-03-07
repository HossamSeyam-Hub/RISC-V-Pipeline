`timescale 1ns / 1ps

module Pipeline_RISCV_tb();

    // 1) Declare local reg and wire identifiers with _tb suffix
    reg Clk, Reset;

    // 2) Instantiate the module under test
    Pipeline_RISCV DUT (
        .clk(Clk), 
        .rst(Reset)
    );

    // 3) Generate stimuli, using initial and always
    // Clock generation
    initial Clk = 1'b0; // Set initial value

    always #25 Clk = ~Clk; // Toggle every 10 time units

    // Test Cases
    initial begin
        Reset = 1'b1;
        #15;
        Reset = 1'b0;
        #4000;
        $finish;
    end


endmodule
