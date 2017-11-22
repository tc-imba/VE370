`ifndef MODULE_SIGN_EXTEND
`define MODULE_SIGN_EXTEND
`timescale 1ns / 1ps

module SignExtend (
    input           [15:0]  in,
    output          [31:0]  out
);

    assign out = {{16{in[15]}}, in[15:0]};

endmodule // SignExtend

`endif
