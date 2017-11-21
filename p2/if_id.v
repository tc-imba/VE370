`ifndef MODULE_IF_ID
`define MODULE_IF_ID

module IF_ID (
    input               clk,
                        stall,
    input       [31:0]  pcAdd4IF,
                        instructionIF,
    output reg  [31:0]  pcAdd4ID,
                        instructionID
);

    initial begin
        pcAdd4ID = 32'b0;
        instructionID = 32'b0;
    end

    always @ (posedge clk) begin
        if (!stall) begin
            pcAdd4ID <= pcAdd4IF;
            instructionID <= instructionIF;
        end
    end

endmodule // IF_ID


`endif // MODULE_IF_ID
