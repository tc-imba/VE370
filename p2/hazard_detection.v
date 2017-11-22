`ifndef MODULE_HAZARD_DETECTION
`define MODULE_HAZARD_DETECTION
`timescale 1ns / 1ps

module HazardDetection (
    input               branchEqID,
                        branchNeID,
                        memReadEX,
                        regWriteEX,
                        memReadMEM,
    input       [4:0]   registerRsID,
                        registerRtID,
                        registerRtEX,
                        registerRdEX,
                        registerRdMEM,
    output reg          stall,
                        flush
);

    initial begin
        stall = 1'b0;
        flush = 1'b0;
    end

    always @ ( * ) begin
        if (memReadEX && registerRtEX && (registerRtEX == registerRsID || registerRtEX == registerRtID)) begin
            stall = 1'b1;
            flush = 1'b1;
        end else if (branchEqID || branchNeID) begin
            if (regWriteEX && registerRdEX && (registerRdEX == registerRsID || registerRdEX == registerRtID)) begin
                stall = 1'b1;
                flush = 1'b1;
            end else if (memReadMEM && registerRdMEM && (registerRdMEM == registerRsID || registerRdMEM == registerRtID)) begin
                stall = 1'b1;
                flush = 1'b1;
            end else begin
                stall = 1'b0;
                flush = 1'b0;
            end
        end else begin
            stall = 1'b0;
            flush = 1'b0;
        end
    end

endmodule // HazardDetection

`endif
