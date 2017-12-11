`ifndef MODULE_REGISTERS
`define MODULE_REGISTERS
`timescale 1ns / 1ps

module Registers (
    input               clk, regWrite,
    input       [4:0]   readReg1, readReg2, readRegExtra,
    input       [4:0]   writeReg,
    output      [31:0]  readData1, readData2, readDataExtra,
    input       [31:0]  writeData
);

    reg [31:0] regs [0:31];
    integer i;

    initial begin
        for (i = 0; i < 32; i = i + 1)
            regs[i] = 32'b0;
    end

    assign readData1 = regs[readReg1];
    assign readData2 = regs[readReg2];
    assign readDataExtra = regs[readRegExtra];

    always @ (negedge clk) begin
        if (regWrite == 1)
            regs[writeReg] <= writeData;
    end

endmodule // registers

`endif
