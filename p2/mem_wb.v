`ifndef MODULE_MEM_WB
`define MODULE_MEM_WB

module MEM_WB (
    input               clk,
                        flush,

    input       [31:0]  dmReadDataMEM,
                        aluResultMEM,
    input       [4:0]   instructionMEM,
    input               memtoRegMEM,
                        regWriteMEM,

    output reg  [31:0]  dmReadDataWB,
                        aluResultWB,
    output reg  [4:0]   instructionWB,
    output reg          memtoRegWB,
                        regWriteWB
);

    initial begin
        dmReadDataWB    = 32'b0;
        aluResultWB     = 32'b0;
        instructionWB   = 5'b0;
        memtoRegWB      = 1'b0;
        regWriteWB      = 1'b0;
    end

    always @ (posedge clk) begin
        if (flush) begin
            dmReadDataWB    <= 32'b0;
            aluResultWB     <= 32'b0;
            instructionWB   <= 5'b0;
            memtoRegWB      <= 1'b0;
            regWriteWB      <= 1'b0;
        end else begin
            dmReadDataWB    <= dmReadDataMEM;
            aluResultWB     <= aluResultMEM;
            instructionWB   <= instructionMEM;
            memtoRegWB      <= memtoRegMEM;
            regWriteWB      <= regWriteMEM;
        end
    end

endmodule // MEM_WB

`endif // MODULE_MEM_WB
