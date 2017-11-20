`ifndef MODULE_CONTROL
`define MODULE_CONTROL

module Control (
    input       [5:0]   opcode,
    output reg          regdst,
                        jump,
                        brancheq,
                        branchne,
                        memread,
                        memtoreg,
                        memwrite,
                        alusrc,
                        regwrite,
    output reg  [1:0]   aluop
);

    initial begin
        regdst      = 1'b0;
        jump        = 1'b0;
        brancheq    = 1'b0;
        branchne    = 1'b0;
        memread     = 1'b0;
        memtoreg    = 1'b0;
        memwrite    = 1'b0;
        alusrc      = 1'b0;
        regwrite    = 1'b0;
        aluop       = 2'b00;
    end

    always @ ( opcode ) begin
        case (opcode)
            6'b000000: begin // R-type
                regdst      <= 1'b1;
                jump        <= 1'b0;
                brancheq    <= 1'b0;
                branchne    <= 1'b0;
                memread     <= 1'b0;
                memtoreg    <= 1'b0;
                memwrite    <= 1'b0;
                alusrc      <= 1'b0;
                regwrite    <= 1'b1;
                aluop       <= 2'b10;
            end
            6'b000010: begin // j
                regdst      <= 1'b1;
                jump        <= 1'b1;
                brancheq    <= 1'b0;
                branchne    <= 1'b0;
                memread     <= 1'b0;
                memtoreg    <= 1'b0;
                memwrite    <= 1'b0;
                alusrc      <= 1'b0;
                regwrite    <= 1'b1;
                aluop       <= 2'b10;
			end
            6'b000100: begin // beq
                regdst      <= 1'b1;
                jump        <= 1'b0;
                brancheq    <= 1'b1;
                branchne    <= 1'b0;
                memread     <= 1'b0;
                memtoreg    <= 1'b0;
                memwrite    <= 1'b0;
                alusrc      <= 1'b0;
                regwrite    <= 1'b0;
                aluop       <= 2'b01;
            end
            6'b000100: begin // bne
                regdst      <= 1'b1;
                jump        <= 1'b0;
                brancheq    <= 1'b0;
                branchne    <= 1'b1;
                memread     <= 1'b0;
                memtoreg    <= 1'b0;
                memwrite    <= 1'b0;
                alusrc      <= 1'b0;
                regwrite    <= 1'b0;
                aluop       <= 2'b01;
            end
            6'b001000: begin // addi
                regdst      <= 1'b0;
                jump        <= 1'b0;
                brancheq    <= 1'b0;
                branchne    <= 1'b0;
                memread     <= 1'b0;
                memtoreg    <= 1'b0;
                memwrite    <= 1'b0;
                alusrc      <= 1'b1;
                regwrite    <= 1'b1;
                aluop       <= 2'b00;
            end
            6'b001100: begin // andi
                regdst      <= 1'b0;
                jump        <= 1'b0;
                brancheq    <= 1'b0;
                branchne    <= 1'b0;
                memread     <= 1'b0;
                memtoreg    <= 1'b0;
                memwrite    <= 1'b0;
                alusrc      <= 1'b1;
                regwrite    <= 1'b1;
                aluop       <= 2'b11;
            end
            6'b100011: begin // lw
                regdst      <= 1'b0;
                jump        <= 1'b0;
                brancheq    <= 1'b0;
                branchne    <= 1'b0;
                memread     <= 1'b1;
                memtoreg    <= 1'b1;
                memwrite    <= 1'b0;
                alusrc      <= 1'b1;
                regwrite    <= 1'b1;
                aluop       <= 2'b00;
			end
            6'b101011: begin // sw
                regdst      <= 1'b0;
                jump        <= 1'b0;
                brancheq    <= 1'b0;
                branchne    <= 1'b0;
                memread     <= 1'b0;
                memtoreg    <= 1'b0;
                memwrite    <= 1'b1;
                alusrc      <= 1'b1;
                regwrite    <= 1'b0;
                aluop       <= 2'b00;
			end

            default: ;
        endcase
    end

endmodule // control

`endif // MODULE_CONTROL
