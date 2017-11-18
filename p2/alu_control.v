`ifndef MODULE_ALU_CONTROL
`define MODULE_ALU_CONTROL

module alu_control (
    input       [5:0]   funct,
    input       [1:0]   op,
    output reg  [3:0]   control
);

    always @ ( funct, op ) begin
        if (op == 2'b00) begin
            // lw / sw (ADD)
            control = 4'b0010;
        end else if (op == 2'b01) begin
            // beq (SUB)
            control = 4'b0110;
        end else begin
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
        end
    end

endmodule // alu_control

`endif // MODULE_ALU_CONTROL
