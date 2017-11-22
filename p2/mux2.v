`ifndef MODULE_MUX2
`define MODULE_MUX2
`timescale 1ns / 1ps

module Mux2 (in0, in1, sel, out);

    parameter   size = 32;
    input                   sel;
    input       [size-1:0]  in0, in1;
    output      [size-1:0]  out;

    assign out = (sel == 1'b0) ? in0 : in1;

endmodule // Mux2

`endif // MODULE_MUX2
