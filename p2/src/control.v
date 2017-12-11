`ifndef MODULE_CONTROL
`define MODULE_CONTROL
`timescale 1ns / 1ps

module Control (
    input       [5:0]   opCode,
    output reg          regDst,
                        jump,
                        branchEq,
                        branchNe,
                        memRead,
                        memtoReg,
                        memWrite,
                        aluSrc,
                        regWrite,
    output reg  [1:0]   aluOp
);

    initial begin
        regDst      = 1'b0;
        jump        = 1'b0;
        branchEq    = 1'b0;
        branchNe    = 1'b0;
        memRead     = 1'b0;
        memtoReg    = 1'b0;
        memWrite    = 1'b0;
        aluSrc      = 1'b0;
        regWrite    = 1'b0;
        aluOp       = 2'b00;
    end

    always @ ( opCode ) begin
        case (opCode)
            6'b000000: begin // R-type
                regDst      <= 1'b1;
                jump        <= 1'b0;
                branchEq    <= 1'b0;
                branchNe    <= 1'b0;
                memRead     <= 1'b0;
                memtoReg    <= 1'b0;
                memWrite    <= 1'b0;
                aluSrc      <= 1'b0;
                regWrite    <= 1'b1;
                aluOp       <= 2'b10;
            end
            6'b000010: begin // j
                regDst      <= 1'b1;
                jump        <= 1'b1;
                branchEq    <= 1'b0;
                branchNe    <= 1'b0;
                memRead     <= 1'b0;
                memtoReg    <= 1'b0;
                memWrite    <= 1'b0;
                aluSrc      <= 1'b0;
                regWrite    <= 1'b0;
                aluOp       <= 2'b10;
			end
            6'b000100: begin // beq
                regDst      <= 1'b1;
                jump        <= 1'b0;
                branchEq    <= 1'b1;
                branchNe    <= 1'b0;
                memRead     <= 1'b0;
                memtoReg    <= 1'b0;
                memWrite    <= 1'b0;
                aluSrc      <= 1'b0;
                regWrite    <= 1'b0;
                aluOp       <= 2'b01;
            end
            6'b000100: begin // bne
                regDst      <= 1'b1;
                jump        <= 1'b0;
                branchEq    <= 1'b0;
                branchNe    <= 1'b1;
                memRead     <= 1'b0;
                memtoReg    <= 1'b0;
                memWrite    <= 1'b0;
                aluSrc      <= 1'b0;
                regWrite    <= 1'b0;
                aluOp       <= 2'b01;
            end
            6'b001000: begin // addi
                regDst      <= 1'b0;
                jump        <= 1'b0;
                branchEq    <= 1'b0;
                branchNe    <= 1'b0;
                memRead     <= 1'b0;
                memtoReg    <= 1'b0;
                memWrite    <= 1'b0;
                aluSrc      <= 1'b1;
                regWrite    <= 1'b1;
                aluOp       <= 2'b00;
            end
            6'b001100: begin // andi
                regDst      <= 1'b0;
                jump        <= 1'b0;
                branchEq    <= 1'b0;
                branchNe    <= 1'b0;
                memRead     <= 1'b0;
                memtoReg    <= 1'b0;
                memWrite    <= 1'b0;
                aluSrc      <= 1'b1;
                regWrite    <= 1'b1;
                aluOp       <= 2'b11;
            end
            6'b100011: begin // lw
                regDst      <= 1'b0;
                jump        <= 1'b0;
                branchEq    <= 1'b0;
                branchNe    <= 1'b0;
                memRead     <= 1'b1;
                memtoReg    <= 1'b1;
                memWrite    <= 1'b0;
                aluSrc      <= 1'b1;
                regWrite    <= 1'b1;
                aluOp       <= 2'b00;
			end
            6'b101011: begin // sw
                regDst      <= 1'b0;
                jump        <= 1'b0;
                branchEq    <= 1'b0;
                branchNe    <= 1'b0;
                memRead     <= 1'b0;
                memtoReg    <= 1'b0;
                memWrite    <= 1'b1;
                aluSrc      <= 1'b1;
                regWrite    <= 1'b0;
                aluOp       <= 2'b00;
			end

            default: ;
        endcase
    end

endmodule // control

`endif // MODULE_CONTROL
