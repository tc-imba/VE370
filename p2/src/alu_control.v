`ifndef MODULE_ALU_CONTROL
`define MODULE_ALU_CONTROL
`timescale 1ns / 1ps

module ALUControl (
    input       [5:0]   funct,
    input       [1:0]   op,
    output reg  [3:0]   control
);

    always @ ( funct, op ) begin
        case (op)
            2'b00: // ADD
                control = 4'b0010;
            2'b01: // SUB
                control = 4'b0110;
            2'b10: // R-type
                case (funct)
                    6'b100000: // ADD
                        control = 4'b0010;
                    6'b100010: // SUB
                        control = 4'b0110;
                    6'b100100: // AND
                        control = 4'b0000;
                    6'b100101: // OR
                        control = 4'b0001;
                    6'b101010: // SLT
                        control = 4'b0111;
                    default: ;
                endcase
            2'b11: // AND
                control = 4'b0000;
            default: ;
        endcase
    end

endmodule // ALUControl

`endif // MODULE_ALU_CONTROL
