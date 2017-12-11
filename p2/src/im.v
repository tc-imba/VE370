`ifndef MODULE_IM
`define MODULE_IM
`timescale 1ns / 1ps

module InstructionMemory (
    input       [31:0]  address,
    output      [31:0]  instruction
);

    parameter size = 64;
    integer i;

    reg [31:0] memory [0:size-1];

    initial begin
        for (i = 0; i < size; i = i + 1)
            memory[i] = 32'b0;
        `include "memory.txt"
    end

    assign instruction = memory[address >> 2];

endmodule // InstructionMemory

`endif // MODULE_IM
