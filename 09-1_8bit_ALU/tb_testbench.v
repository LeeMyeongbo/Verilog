`timescale 1ns/1ps

`define DATAFLOW_LEVEL1

module tb_testbench;

wire [7:0] a, b, res;
wire [1:0] ALUCtrl;

ALU_test tester(.t1(a), .t2(b), .t3(ALUCtrl), .p1(res));
//                |       |        |               ▲
//                ▼       ▼        ▼               |
ALU      dut   (.a(a), .b(b), .ALUCtrl(ALUCtrl), .res(res));

always @(a or b or res or ALUCtrl) begin
    #1;
    $display("%2b : %8b %8b %8b (%2b : %d %d %d)", ALUCtrl, a, b, res, ALUCtrl, a, b, res);
end

initial begin
    $dumpfile("tb_test_out.vcd");
    $dumpvars(0, dut);
end

endmodule