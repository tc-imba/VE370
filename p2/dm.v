`ifndef MODULE_DM
`define MODULE_DM
`timescale 1ns / 1ps

module DataMemory (
    input               clk,
    input       [31:0]  address,
                        writeData,
    input               memRead,
                        memWrite,
    output      [31:0]  readData
);

    wire        [31:0]  index;
    parameter           size = 8;
    integer             i;
    reg         [31:0]  memory [0:size-1];

    assign index = address >> 2;


    initial begin
        for (i = 0; i < size; i = i + 1)
            memory[i] = 32'b0;
        //readData = 32'b0;
    end

    always @ ( posedge clk ) begin
        if (memWrite == 1'b1) begin
            memory[index] = writeData;
        end
    end

    assign readData = (memRead == 1'b1) ? memory[index] : 32'b0;

endmodule // DataMemory


`endif
