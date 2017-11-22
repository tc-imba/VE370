`ifndef MODULE_SSD_DRIVER
`define MODULE_SSD_DRIVER
`timescale 1ns / 1ps

module SSDDriver(
    input       [3:0]   Q,
    output reg  [6:0]   C
);

    initial begin
        C = 7'b1111111;
    end

    always @( * ) begin
        case (Q)
            4'h0: C = 7'b1000000;
            4'h1: C = 7'b1111001;
            4'h2: C = 7'b0100100;
            4'h3: C = 7'b0110000;
            4'h4: C = 7'b0011001;
            4'h5: C = 7'b0010010;
            4'h6: C = 7'b0000010;
            4'h7: C = 7'b1111000;
            4'h8: C = 7'b0000000;
            4'h9: C = 7'b0010000;
            4'ha: C = 7'b0001000;
            4'hb: C = 7'b0000011;
            4'hc: C = 7'b1000110;
            4'hd: C = 7'b0100001;
            4'he: C = 7'b0000110;
            4'hf: C = 7'b0001110;
            default: C = 7'b1111111;
        endcase
    end
endmodule

`endif
