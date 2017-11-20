`include "alu.v"
`include "alu_control.v"
`include "control.v"
`include "im.v"
`include "mux2.v"
`include "registers.v"
`include "dm.v"
`include "sign_extend.v"
`include "pc.v"

module single_cycle (input clk);

    wire        [31:0]  pcIn,
                        pcOut,
                        pcAdd4,
                        instruction,
                        jumpAddress,
                        branchResult,
                        addResult;

    wire                branch;

    wire                regdst,
                        jump,
                        brancheq,
                        branchne,
                        memread,
                        memtoreg,
                        memwrite,
                        alusrc,
                        regwrite;
    wire        [1:0]   aluop;

    wire        [4:0]   regWriteReg;
    wire        [31:0]  regWriteData,
                        regReadData1,
                        regReadData2;

    wire        [31:0]  signExtendOut,
                        aluMainIn,
                        aluMainResult;
    wire        [3:0]   aluMainControl;
    wire                aluMainZero;

    wire        [31:0]  dmReadData;


    assign pcAdd4 = pcOut + 4;
    assign addResult = pcAdd4 + (signExtendOut << 2);
    assign branch = (brancheq & aluMainZero) | (branchne & ~aluMainZero);
    assign branchResult = (branch == 1'b0) ? pcAdd4 : addResult;
    assign jumpAddress = {pcAdd4[31:28], instruction[25:0], 2'b0};
    assign pcIn = (jump == 1'b0) ? branchResult : jumpAddress;

    assign regWriteReg = (regdst == 1'b0) ? instruction[20:16] : instruction[15:11];
    assign regWriteData = (memtoreg == 1'b0) ? aluMainResult : dmReadData;
    assign aluMainIn = (alusrc == 1'b0) ? regReadData2 : signExtendOut;

    PC pc(
        .clk(clk),
        .in(pcIn),
        .out(pcOut)
    );

    InstructionMemory im(
        .address(pcOut),
        .instruction(instruction)
    );

    Control control(
        .opcode(instruction[31:26]),
        .regdst(regdst),
        .jump(jump),
        .brancheq(brancheq),
        .branchne(branchne),
        .memread(memread),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .alusrc(alusrc),
        .regwrite(regwrite),
        .aluop(aluop)
    );

    SignExtend signExtend(
        .in(instruction[15:0]),
        .out(signExtendOut)
    );

    ALUControl aluControl(
        .funct(instruction[5:0]),
        .op(aluop),
        .control(aluMainControl)
    );

    Registers registers(
        .clk(clk),
        .readReg1(instruction[25:21]),
        .readReg2(instruction[20:16]),
        .readData1(regReadData1),
        .readData2(regReadData2),
        .writeReg(regWriteReg),
        .writeData(regWriteData),
        .regWrite(regwrite)
    );

    ALU aluMain(
        .a(regReadData1),
        .b(aluMainIn),
        .control(aluMainControl),
        .zero(aluMainZero),
        .result(aluMainResult)
    );

    DataMemory dm(
        .clk(clk),
        .address(aluMainResult),
        .writeData(regReadData2),
        .readData(dmReadData),
        .memWrite(memwrite),
        .memRead(memread)
    );

endmodule // single_cycle
