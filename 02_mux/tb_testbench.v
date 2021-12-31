`timescale 1ns/1ps
`define GATE_LEVEL
//`define DATAFLOW_LEVEL

module tb_testbench;

wire n1, n2, n3, n4;                // 연결다리 wire

mux_test tester(n1, n2, n3, n4);
//              |   |   |   ▲
//              ▼   ▼   ▼   |
my_mux dut     (n1, n2, n3, nr);        // tester의 n1, n2가 dut의 n1, n2로 가고 dut의 n3가 tester의 n3로 감

always @(n1, n2, n3, n4) begin
    #1;
    $display("%b %b %b", n1, n2, n3, n4);
end

initial begin
    $dumpfile("tb_test_out.vcd");
    $dumpvars(0, dut);
end

endmodule