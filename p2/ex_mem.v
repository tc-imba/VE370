`ifndef MODULE_EX_MEM
`define MODULE_EX_MEM

module EX_MEM (
    input               clk,
                        flush,

    input       [31:0]  pcAddResultEX,
                        aluResultEX,
                        regReadData2EX,
    input       [4:0]   instructionEX,
    input               memReadEX,
                        memtoRegEX,
                        memWriteEX,
                        regWriteEX,

    output reg  [31:0]  pcAddResultMEM,
                        aluResultMEM,
                        regReadData2MEM,
    output reg  [4:0]   instructionMEM,
    output reg          memReadMEM,
                        memtoRegMEM,
                        memWriteMEM,
                        regWriteMEM
);

    initial begin
        pcAddResultMEM  = 32'b0;
        aluResultMEM    = 32'b0;
        regReadData2MEM = 32'b0;
        instructionMEM  = 5'b0;
        memReadMEM      = 1'b0;
        memtoRegMEM     = 1'b0;
        memWriteMEM     = 1'b0;
        regWriteMEM     = 1'b0;
    end

    always @ (posedge clk) begin
        if (flush) begin
            pcAddResultMEM  <= 32'b0;
            aluResultMEM    <= 32'b0;
            regReadData2MEM <= 32'b0;
            instructionMEM  <= 5'b0;
            memReadMEM      <= 1'b0;
            memtoRegMEM     <= 1'b0;
            memWriteMEM     <= 1'b0;
            regWriteMEM     <= 1'b0;
        end else begin
            pcAddResultMEM  <= pcAddResultEX;
            aluResultMEM    <= aluResultEX;
            regReadData2MEM <= regReadData2EX;
            instructionMEM  <= instructionEX;
            memReadMEM      <= memReadEX;
            memtoRegMEM     <= memtoRegEX;
            memWriteMEM     <= memWriteEX;
            regWriteMEM     <= regWriteEX;
        end
    end

endmodule // EX_MEM

`endif // MODULE_EX_MEM
