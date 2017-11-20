`ifndef MODULE_IFID
`define MODULE_IFID

module IFID (
    input               clk,
                        hold,
    input       [31:0]  pcAdd4IF,
                        instructionIF,
    output reg  [31:0]  pcAdd4ID,
                        instructionID
);

    reg                 flag;

    initial begin
        pcAdd4ID = 32'b0;
        instructionID = 32'b0;
        flag = 1'b0;
    end

    always @ (posedge clk) begin
        if (hold && !flag) begin
            flag <= 1'b1;
        end else begin
            flag <= 1'b0;
            pcAdd4ID <= pcAdd4IF;
            instructionID <= instructionIF;
        end
    end

endmodule // IFID


`endif
