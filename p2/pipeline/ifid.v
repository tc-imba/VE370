`ifndef MODULE_IFID
`define MODULE_IFID

module ifid (
    input       [31:0]  PCcount;
    input       [31:0]  IMcount;
    input               clk;
    input               hold;
    output reg  [31:0]  PCID;
    output reg  [31:0]  IMID;
    reg                 flag;
);

initial begin
    PCID = 32'b0;
    IMID = 32'b0;
    flag = 1'b0;
end

always@(posedge clk) begin
        if ((hold) && (flag == 1'b0)) begin
            flag <= 1'b1;
        end
        else begin
            flag <= 1'b0;
            PCID <= PCcount;
            IMID <= IMcount;
        end
end

endmodule // ifid


`endif
