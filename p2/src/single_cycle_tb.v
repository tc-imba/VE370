`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   00:39:53 11/20/2017
// Design Name:   single_cycle
// Module Name:   /home/liu/VE370/p2/single_cycle_tb.v
// Project Name:  p2
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: single_cycle
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

`include "single_cycle.v"

module single_cycle_tb;

    integer i = 0;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	single_cycle uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
        $dumpfile("single_cycle.vcd");
        $dumpvars(1, uut);
        $display("Texual result of single cycle:");
        $display("==========================================================");
        #500;
        $stop;
	end

    always #10 begin
        $display("Time: %d, CLK = %d, PC = 0x%H", i, clk, uut.pcOut);
        $display("[$s0] = 0x%H, [$s1] = 0x%H, [$s2] = 0x%H", uut.registers.regs[16], uut.registers.regs[17], uut.registers.regs[18]);
        $display("[$s3] = 0x%H, [$s4] = 0x%H, [$s5] = 0x%H", uut.registers.regs[19], uut.registers.regs[20], uut.registers.regs[21]);
        $display("[$s6] = 0x%H, [$s7] = 0x%H, [$t0] = 0x%H", uut.registers.regs[22], uut.registers.regs[23], uut.registers.regs[8]);
        $display("[$t1] = 0x%H, [$t2] = 0x%H, [$t3] = 0x%H", uut.registers.regs[9], uut.registers.regs[10], uut.registers.regs[11]);
        $display("----------------------------------------------------------");
        clk = ~clk;
        if (~clk) i = i + 1;
    end

endmodule
