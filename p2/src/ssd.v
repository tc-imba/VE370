`ifndef MODULE_SSD
`define MODULE_SSD

`include "ring_counter.v"
`include "clock_divider.v"
`include "ssd_driver.v"

module SSD (
    input               clk,
    input       [15:0]  number,
    output      [6:0]   C,
    output reg  [3:0]   AN
);
    wire                clk500,
                        clk1;
    wire        [1:0]   counter;
    reg         [3:0]   Q;

    initial begin
        Q = 4'b0000;
        AN = 4'b1111;
    end

    ClockDivider #(
        .ratio(100000)
    ) clockDivider1(
        .clk(clk),
        .divided(clk500)
    );

    ClockDivider #(
        .ratio(500)
    ) clockDivider2(
        .clk(clk),
        .divided(clk1)
    );

    RingCounter ringCounter(
        .clk(clk500),
        .counter(counter)
    );

    always @ ( * ) begin
        case (counter)
            2'b00: begin
                Q = number[15:12];
                AN = 4'b0111;
            end
            2'b01: begin
                Q = number[11:8];
                AN = 4'b1011;
            end
            2'b10: begin
                Q = number[7:4];
                AN = 4'b1101;
            end
            2'b11: begin
                Q = number[3:0];
                AN = 4'b1110;
            end
            default: begin
                Q = 4'b0000;
                AN = 4'b1111;
            end
        endcase
    end

    SSDDriver ssdDriver (.Q(Q), .C(C));

endmodule // SSD

`endif
