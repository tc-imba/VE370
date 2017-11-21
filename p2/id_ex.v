`ifndef MODULE_ID_EX
`define MODULE_ID_EX

module ID_EX (
    input               clk,
                        flush,
                        stall,

    input       [31:0]  pcAdd4ID,
                        regReadData1ID,
                        regReadData2ID,
                        signExtendID,
    input       [4:0]   instructionRtID,
                        instructionRdID,
    input       [1:0]   aluOpID,
    input               regDstID,
                        memReadID,
                        memtoRegID,
                        memWriteID,
                        aluSrcID,
                        regWriteID,

    output reg  [31:0]  pcAdd4EX,
                        regReadData1EX,
                        regReadData2EX,
                        signExtendEX,
    output reg  [4:0]   instructionRtEX,
                        instructionRdEX,
    output reg  [1:0]   aluOpEX,
    output reg          regDstEX,
                        memReadEX,
                        memtoRegEX,
                        memWriteEX,
                        aluSrcEX,
                        regWriteEX
);

    initial begin
        pcAdd4EX        = 32'b0;
        regReadData1EX     = 32'b0;
        regReadData2EX     = 32'b0;
        signExtendEX    = 32'b0;
        instructionRtEX = 5'b0;
        instructionRdEX = 5'b0;
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
            pcAdd4EX        <= 32'b0;
            regReadData1EX  <= 32'b0;
            regReadData2EX  <= 32'b0;
            signExtendEX    <= 32'b0;
            instructionRtEX <= 5'b0;
            instructionRdEX <= 5'b0;
            aluOpEX         <= 2'b0;
            regDstEX        <= 1'b0;
            memReadEX       <= 1'b0;
            memtoRegEX      <= 1'b0;
            memWriteEX      <= 1'b0;
            aluSrcEX        <= 1'b0;
            regWriteEX      <= 1'b0;
        end else if (!stall) begin
            pcAdd4EX        <= pcAdd4ID;
            regReadData1EX  <= regReadData1EX;
            regReadData2EX  <= regReadData2EX;
            signExtendEX    <= signExtendID;
            instructionRtEX <= instructionRtID;
            instructionRdEX <= instructionRdID;
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
