`ifndef MODULE_IM
`define MODULE_IM

module im (
    input       [31:0]  address,
    output      [31:0]  instruction
);

    parameter size = 64;
    integer i;

    reg [31:0] memory [0:size-1];

    initial begin
        for (i = 0; i < size; ++i)
            memory[i] = 32'b0;
        `include "test.txt"
    end

    assign instruction = memory[address >> 2];

endmodule // im

`endif // MODULE_IM
