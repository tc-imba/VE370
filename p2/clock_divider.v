`ifndef MODULE_CLOCK_DIVIDER
`define MODULE_CLOCK_DIVIDER
`timescale 1ns / 1ps

module ClockDivider(
    input               clk,
    output reg          divided
);

    parameter ratio = 10;
    integer now = 1;

    initial begin
        divided = 1'b0;
    end

    always @(posedge clk) begin
        if (now <= ratio / 2) divided = 1;
        else divided = 0;
        if (now == ratio) now = 1;
        else now = now + 1;
    end

endmodule

`endif // MODULE_CLOCK_DIVIDER
