`timescale 1ns/1ps

`define DATAFLOW_LEVEL1

module tb_testbench;

wire       A, B, RES;
wire [1:0] ALUCTRL;

ALU_test tester(.t1(A), .t2(B), .t3(ALUCTRL), .p1(RES));
//                |       |        |               ▲
//                ▼       ▼        ▼               |
ALU      dut   (.A(A), .B(B), .ALUCtrl(ALUCTRL), .Res(RES));

always @(A or B or RES or ALUCTRL) begin
    #1;
    $display("%2b %b %b %b", ALUCTRL, A, B, RES);
end

initial begin
    $dumpfile("tb_test_out.vcd");
    $dumpvars(0, dut);
end

endmodule