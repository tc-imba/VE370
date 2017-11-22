`ifndef MODULE_MEM_WB
`define MODULE_MEM_WB
`timescale 1ns / 1ps

module MEM_WB (
    input               clk,

    input       [31:0]  dmReadDataMEM,
                        aluResultMEM,
    input       [4:0]   registerMEM,
    input               memtoRegMEM,
                        regWriteMEM,

    output reg  [31:0]  dmReadDataWB,
                        aluResultWB,
    output reg  [4:0]   registerWB,
    output reg          memtoRegWB,
                        regWriteWB
);

    initial begin
        dmReadDataWB    = 32'b0;
        aluResultWB     = 32'b0;
        registerWB      = 5'b0;
        memtoRegWB      = 1'b0;
        regWriteWB      = 1'b0;
    end

    always @ (posedge clk) begin
        dmReadDataWB    <= dmReadDataMEM;
        aluResultWB     <= aluResultMEM;
        registerWB      <= registerMEM;
        memtoRegWB      <= memtoRegMEM;
        regWriteWB      <= regWriteMEM;
    end

endmodule // MEM_WB

`endif // MODULE_MEM_WB
