`ifndef MODULE_RING_COUNTER
`define MODULE_RING_COUNTER
`timescale 1ns / 1ps

module RingCounter(
    input               clk,
    output reg  [1:0]   counter
);
    initial begin
        counter = 2'b0;
    end

    always @(posedge clk) begin
        counter = counter + 1;
    end
endmodule

`endif // MODULE_RING_COUNTER
