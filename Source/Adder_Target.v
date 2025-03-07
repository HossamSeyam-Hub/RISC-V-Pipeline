module Adder_Target (PC, ImmExt, PCTarget);

    input  signed [31:0] PC;
    input  signed [31:0] ImmExt;
    output signed [31:0] PCTarget;

    assign PCTarget = PC + ImmExt;

endmodule
