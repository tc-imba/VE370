`ifndef MODULE_IM
`define MODULE_IM

module im (
    input       [31:0]  address,
    output      [31:0]  instruction
);

    parameter filename = "test.txt"; // should be in hex form
    parameter size = 1024;

    reg [31:0] memory [0:size-1];
    initial begin
        $readmemh(filename, memory, 0, size - 1);
    end

    assign instruction = memory[address];

endmodule // im

`endif // MODULE_IM
