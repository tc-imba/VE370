`ifndef MODULE_HAZARD_DETECTION
`define MODULE_HAZARD_DETECTION

module HazardDetection (
    input               memReadEX,
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
        if (memReadEX && (registerRtEX == registerRsID || registerRtEX == registerRtID)) begin
            stall = 1'b1;
            flush = 1'b1;
        end else if () begin
        end else begin
            stall = 1'b0;
            flush = 1'b0;
        end
    end

endmodule // HazardDetection

`endif
