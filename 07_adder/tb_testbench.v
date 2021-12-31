`timescale 1ns/1ps

//`define DATAFLOW_LEVEL1
`define GATE_LEVEL

module tb_testbench;

wire A, B, CIN, S, COUT;

adder_test tester(.t1(CIN), .t2(A), .t3(B), .p1(S), .p2(COUT));
//                    |       |        |      ▲         ▲
//                    ▼       ▼        ▼      |         |
adder       dut  (.Cin(CIN), .A(A), .B(B), .S(S), .Cout(COUT));

always @(A or B or CIN or S or COUT) begin
    #1;
    $display("%b %b %b %b %b", CIN, A, B, COUT, S);
end

initial begin
    $dumpfile("tb_test_out.vcd");
    $dumpvars(0, dut);
end

endmodule