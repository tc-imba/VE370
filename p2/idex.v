`ifndef MODULE_IDEX
`define MODULE_IDEX

module IDEX (
    input       [31:0]  pcAdd4ID,
                        readData1ID,
                        readData2ID,
                        signExtendID,
    input       [4:0]   instruction,
    input               regDstID,
                        jumpID,
                        branchEqID,
                        branchNeID,
                        memReadID,
                        memtoRegID,
                        memWriteID,
                        aluSrcID,
                        regWriteID,
    input       [1:0]   aluOpID,

    output reg  [31:0]  pcAdd4EX,
                        readData1EX,
                        readData2EX,
    output reg          regDstEX,
                        jumpEX,
                        branchEqEX,
                        branchNeEX,
                        memReadEX,
                        memtoRegEX,
                        memWriteEX,
                        aluSrcEX,
                        regWriteEX,
    output reg  [1:0]   aluOpEX
);

endmodule // IDEX

`endif
