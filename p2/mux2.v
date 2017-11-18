`ifndef MODULE_MUX2
`define MODULE_MUX2

module mux (in0, in1, sel, out);

    parameter   size = 32;
    input                   sel;
    input       [size-1:0]  in0, in1;
    output      [size-1:0]  out;

    assign out = (sel == 1'b0) ? in0 : in1;

endmodule // mux

`endif // MODULE_MUX2
