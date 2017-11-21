`ifndef MODULE_FORWARD
`define MODULE_FORWARD

module Forward (
    input       [4:0]   registerRsEX,
                        registerRtEX,
                        registerRdMEM,
                        registerRdWB,
    input               regWriteMEM,
                        regWriteWB,
    output reg  [1:0]   forwardA,
                        forwardB
);

initial begin
    forwardA = 2'b00;
    forwardB = 2'b00;
end

    always @ ( * ) begin
        if (regWriteMEM && registerRdMEM && registerRdMEM == registerRsEX)
            forwardA = 2'b10;
        else if (regWriteWB && registerRdWB && registerRdWB == registerRsEX)
            forwardA = 2'b01;
        else
            forwardA = 2'b00;

        if (regWriteMEM && registerRdMEM && registerRdMEM == registerRtEX)
            forwardB = 2'b10;
        else if (regWriteWB && registerRdWB && registerRdWB == registerRtEX)
            forwardB = 2'b01;
        else
            forwardB = 2'b00;
    end

endmodule // Forward

`endif // MODULE_FORWARD
