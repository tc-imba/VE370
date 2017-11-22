`ifndef MODULE_MAIN
`define MODULE_MAIN
`timescale 1ns / 1ps

`include "pipeline.v"
`include "ssd.v"

module main (
    input               clk50M,
                        clk,
                        pc,
    input       [4:0]   register,
    output      [6:0]   C,
    output      [3:0]   AN
);

    wire        [4:0]   regIn;
    wire        [31:0]  pcOut,
                        regOut;
    wire        [15:0]  display;

    assign display = (pc) ? pcOut : regOut;
    assign regIn = (register < 8) ? register + 16 :
        ((register < 16) ? register : register + 8);

    Pipeline pipeline(
        .clk(clk),
        .pcOut(pcOut),
        .regIn(regIn),
        .regOut(regOut)
    );

    SSD ssd (
        .clk(clk50M),
        .number(display),
        .C(C), .AN(AN)
    );

endmodule // main

`endif // MODULE_MAIN
