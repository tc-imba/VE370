`ifndef MODULE_ID_EX
`define MODULE_ID_EX
`timescale 1ns / 1ps

module ID_EX (
    input               clk,
                        flush,

    input       [31:0]  regReadData1ID,
                        regReadData2ID,
                        signExtendID,
    input       [4:0]   registerRsID,
                        registerRtID,
                        registerRdID,
    input       [1:0]   aluOpID,
    input               regDstID,
                        memReadID,
                        memtoRegID,
                        memWriteID,
                        aluSrcID,
                        regWriteID,

    output reg  [31:0]  regReadData1EX,
                        regReadData2EX,
                        signExtendEX,
    output reg  [4:0]   registerRsEX,
                        registerRtEX,
                        registerRdEX,
    output reg  [1:0]   aluOpEX,
    output reg          regDstEX,
                        memReadEX,
                        memtoRegEX,
                        memWriteEX,
                        aluSrcEX,
                        regWriteEX
);

    initial begin
        regReadData1EX  = 32'b0;
        regReadData2EX  = 32'b0;
        signExtendEX    = 32'b0;
        registerRsEX    = 5'b0;
        registerRtEX    = 5'b0;
        registerRdEX    = 5'b0;
        aluOpEX         = 2'b0;
        regDstEX        = 1'b0;
        memReadEX       = 1'b0;
        memtoRegEX      = 1'b0;
        memWriteEX      = 1'b0;
        aluSrcEX        = 1'b0;
        regWriteEX      = 1'b0;
    end

    always @ (posedge clk) begin
        if (flush) begin
            aluOpEX         <= 2'b0;
            regDstEX        <= 1'b0;
            memReadEX       <= 1'b0;
            memtoRegEX      <= 1'b0;
            memWriteEX      <= 1'b0;
            aluSrcEX        <= 1'b0;
            regWriteEX      <= 1'b0;
        end else begin
            regReadData1EX  <= regReadData1ID;
            regReadData2EX  <= regReadData2ID;
            signExtendEX    <= signExtendID;
            registerRsEX    <= registerRsID;
            registerRtEX    <= registerRtID;
            registerRdEX    <= registerRdID;
            aluOpEX         <= aluOpID;
            regDstEX        <= regDstID;
            memReadEX       <= memReadID;
            memtoRegEX      <= memtoRegID;
            memWriteEX      <= memWriteID;
            aluSrcEX        <= aluSrcID;
            regWriteEX      <= regWriteID;
        end
    end

endmodule // ID_EX

`endif // MODULE_ID_EX
