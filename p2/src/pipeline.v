`ifndef MODULE_PIPELINE
`define MODULE_PIPELINE
`timescale 1ns / 1ps

`include "alu.v"
`include "alu_control.v"
`include "control.v"
`include "im.v"
`include "mux2.v"
`include "registers.v"
`include "dm.v"
`include "sign_extend.v"
`include "pc.v"
`include "if_id.v"
`include "id_ex.v"
`include "ex_mem.v"
`include "mem_wb.v"
`include "forward.v"
`include "hazard_detection.v"

module Pipeline (
    input               clk,
    input       [4:0]   regIn,
    output      [31:0]  pcOut,
                        regOut
);

    wire                flushIFID,
                        flushIDEX,
                        stall;

    // IF stage
    wire        [31:0]  pcInIF,
                        pcOutIF,
                        pcAdd4IF,
                        instructionIF,
                        branchResultIF;

    // ID stage
    wire        [31:0]  pcAdd4ID,
                        pcAddResultID,
                        instructionID,
                        regReadData1ID,
                        regReadData2ID,
                        regReadData1NewID,
                        regReadData2NewID,
                        signExtendID,
                        jumpAddressID;
    wire        [4:0]   registerRsID,
                        registerRtID,
                        registerRdID;
    wire        [1:0]   aluOpID;
    wire                regDstID,
                        jumpID,
                        branchEqID,
                        branchNeID,
                        memReadID,
                        memtoRegID,
                        memWriteID,
                        aluSrcID,
                        regWriteID,
                        branchID,
                        regReadDataEqID;

    // EX stage
    wire        [31:0]  regReadData1EX,
                        regReadData2EX,
                        signExtendEX,
                        aluInAEX,
                        aluInTempBEX,
                        aluInBEX,
                        aluResultEX;
    wire        [4:0]   registerRsEX,
                        registerRtEX,
                        registerRdEX,
                        registerEX;
    wire        [3:0]   aluControlEX;
    wire        [1:0]   aluOpEX;
    wire                regDstEX,
                        memReadEX,
                        memtoRegEX,
                        memWriteEX,
                        aluSrcEX,
                        regWriteEX,
                        aluZeroEX;

    // MEM stage
    wire        [31:0]  aluResultMEM,
                        regReadData2MEM,
                        dmReadDataMEM;
    wire        [4:0]   registerMEM;
    wire                memReadMEM,
                        memtoRegMEM,
                        memWriteMEM,
                        regWriteMEM;
    // WB stage
    wire        [31:0]  aluResultWB,
                        dmReadDataWB,
                        regWriteDataWB;
    wire        [4:0]   registerWB;
    wire                memtoRegWB,
                        regWriteWB;

    // Data Hazard
    wire        [1:0]   forwardA,
                        forwardB;
    wire                forwardC,
                        forwardD;

    // IF stage
    PC pc(
        .clk(clk), .stall(stall),
        .in(pcInIF), .out(pcOutIF)
    );
    InstructionMemory im(.address(pcOutIF), .instruction(instructionIF));
    assign pcAdd4IF = pcOutIF + 4;

    // IF/ID
    IF_ID ifid (
        .clk(clk), .stall(stall), .flush(flushIFID),
        .pcAdd4IF(pcAdd4IF), .pcAdd4ID(pcAdd4ID),
        .instructionIF(instructionIF), .instructionID(instructionID)
    );

    // ID stage
    assign registerRsID = instructionID[25:21];
    assign registerRtID = instructionID[20:16];
    assign registerRdID = instructionID[15:11];
    Control control (
        .opCode(instructionID[31:26]),
        .regDst(regDstID),
        .jump(jumpID),
        .branchEq(branchEqID),
        .branchNe(branchNeID),
        .memRead(memReadID),
        .memtoReg(memtoRegID),
        .memWrite(memWriteID),
        .aluSrc(aluSrcID),
        .regWrite(regWriteID),
        .aluOp(aluOpID)
    );
    Registers registers (
        .clk(clk),
        .readReg1(registerRsID),
        .readReg2(registerRtID),
        .readData1(regReadData1ID),
        .readData2(regReadData2ID),
        .writeReg(registerWB),
        .writeData(regWriteDataWB),
        .regWrite(regWriteWB),
        .readRegExtra(regIn),
        .readDataExtra(regOut)
    );
    SignExtend signExtend(.in(instructionID[15:0]), .out(signExtendID));
    assign pcAddResultID = pcAdd4ID + (signExtendID << 2);
    assign regReadData1NewID = (forwardC) ? aluResultMEM : regReadData1ID;
    assign regReadData2NewID = (forwardD) ? aluResultMEM : regReadData2ID;
    assign regReadDataEqID = (regReadData1NewID == regReadData2NewID);
    assign branchID = (branchEqID && regReadDataEqID) || (branchNeID && !regReadDataEqID);
    assign branchResultIF = (!branchID) ? pcAdd4IF : pcAddResultID;
    assign jumpAddressID = {pcAdd4ID[31:28], instructionID[25:0], 2'b0};
    assign pcInIF = (!jumpID) ? branchResultIF : jumpAddressID;
    assign flushIFID = branchID;

    // ID/EX
    ID_EX idex (
        .clk(clk), .flush(flushIDEX),
        .regReadData1ID(regReadData1ID), .regReadData1EX(regReadData1EX),
        .regReadData2ID(regReadData2ID), .regReadData2EX(regReadData2EX),
        .signExtendID(signExtendID), .signExtendEX(signExtendEX),
        .registerRsID(registerRsID), .registerRsEX(registerRsEX),
        .registerRtID(registerRtID), .registerRtEX(registerRtEX),
        .registerRdID(registerRdID), .registerRdEX(registerRdEX),
        .aluOpID(aluOpID), .aluOpEX(aluOpEX),
        .regDstID(regDstID), .regDstEX(regDstEX),
        .memReadID(memReadID), .memReadEX(memReadEX),
        .memtoRegID(memtoRegID), .memtoRegEX(memtoRegEX),
        .memWriteID(memWriteID), .memWriteEX(memWriteEX),
        .aluSrcID(aluSrcID), .aluSrcEX(aluSrcEX),
        .regWriteID(regWriteID), .regWriteEX(regWriteEX)
    );

    // EX stage
    ALUControl aluControl (
        .funct(signExtendEX[5:0]),
        .op(aluOpEX),
        .control(aluControlEX)
    );
    assign aluInAEX = (forwardA == 2'b00) ? regReadData1EX :
        ((forwardA == 2'b01) ? regWriteDataWB : aluResultMEM);
    assign aluInTempBEX = (forwardB == 2'b00) ? regReadData2EX :
        ((forwardB == 2'b01) ? regWriteDataWB : aluResultMEM);
    assign aluInBEX = (!aluSrcEX) ? aluInTempBEX : signExtendEX;
    ALU alu (
        .a(aluInAEX),
        .b(aluInBEX),
        .control(aluControlEX),
        .zero(aluZeroEX),
        .result(aluResultEX)
    );
    assign registerEX = (!regDstEX) ? registerRtEX : registerRdEX;

    // EX/MEM
    EX_MEM exmem (
        .clk(clk),
        .aluResultEX(aluResultEX), .aluResultMEM(aluResultMEM),
        .regReadData2EX(aluInTempBEX), .regReadData2MEM(regReadData2MEM),
        .registerEX(registerEX), .registerMEM(registerMEM),
        .memReadEX(memReadEX), .memReadMEM(memReadMEM),
        .memtoRegEX(memtoRegEX), .memtoRegMEM(memtoRegMEM),
        .memWriteEX(memWriteEX), .memWriteMEM(memWriteMEM),
        .regWriteEX(regWriteEX), .regWriteMEM(regWriteMEM)
    );

    // MEM stage
    DataMemory dm (
        .clk(clk),
        .address(aluResultMEM),
        .writeData(regReadData2MEM),
        .readData(dmReadDataMEM),
        .memWrite(memWriteMEM),
        .memRead(memReadMEM)
    );

    // MEM/WB
    MEM_WB memwb (
        .clk(clk),
        .dmReadDataMEM(dmReadDataMEM), .dmReadDataWB(dmReadDataWB),
        .aluResultMEM(aluResultMEM), .aluResultWB(aluResultWB),
        .registerMEM(registerMEM), .registerWB(registerWB),
        .memtoRegMEM(memtoRegMEM), .memtoRegWB(memtoRegWB),
        .regWriteMEM(regWriteMEM), .regWriteWB(regWriteWB)
    );

    // WB stage
    assign regWriteDataWB = (!memtoRegWB) ? aluResultWB : dmReadDataWB;
    //assign regWriteDataWB = aluResultWB;

    // Data Hazard
    Forward forward (
        .registerRsID(registerRsID),
        .registerRtID(registerRtID),
        .registerRsEX(registerRsEX),
        .registerRtEX(registerRtEX),
        .registerRdMEM(registerMEM),
        .registerRdWB(registerWB),
        .regWriteMEM(regWriteMEM),
        .regWriteWB(regWriteWB),
        .forwardA(forwardA),
        .forwardB(forwardB),
        .forwardC(forwardC),
        .forwardD(forwardD)
    );

    HazardDetection hazardDetection (
        .branchEqID(branchEqID),
        .branchNeID(branchNeID),
        .memReadEX(memReadEX),
        .regWriteEX(regWriteEX),
        .memReadMEM(memReadMEM),
        .registerRsID(registerRsID),
        .registerRtID(registerRtID),
        .registerRtEX(registerRtEX),
        .registerRdEX(registerEX),
        .registerRdMEM(registerMEM),
        .stall(stall),
        .flush(flushIDEX)
    );

    // Output
    assign pcOut = pcOutIF;


endmodule // pipeline

`endif
