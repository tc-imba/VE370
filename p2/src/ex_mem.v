`ifndef MODULE_EX_MEM
`define MODULE_EX_MEM
`timescale 1ns / 1ps

module EX_MEM (
    input               clk,

    input       [31:0]  aluResultEX,
                        regReadData2EX,
    input       [4:0]   registerEX,
    input               memReadEX,
                        memtoRegEX,
                        memWriteEX,
                        regWriteEX,

    output reg  [31:0]  aluResultMEM,
                        regReadData2MEM,
    output reg  [4:0]   registerMEM,
    output reg          memReadMEM,
                        memtoRegMEM,
                        memWriteMEM,
                        regWriteMEM
);

    initial begin
        aluResultMEM    = 32'b0;
        regReadData2MEM = 32'b0;
        registerMEM     = 5'b0;
        memReadMEM      = 1'b0;
        memtoRegMEM     = 1'b0;
        memWriteMEM     = 1'b0;
        regWriteMEM     = 1'b0;
    end

    always @ (posedge clk) begin
        aluResultMEM    <= aluResultEX;
        regReadData2MEM <= regReadData2EX;
        registerMEM     <= registerEX;
        memReadMEM      <= memReadEX;
        memtoRegMEM     <= memtoRegEX;
        memWriteMEM     <= memWriteEX;
        regWriteMEM     <= regWriteEX;
    end

endmodule // EX_MEM

`endif // MODULE_EX_MEM
