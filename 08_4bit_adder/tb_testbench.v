`timescale 1ns/1ps

`define DATAFLOW_LEVEL1

module tb_testbench;

wire [3:0] A, B, S;
wire CIN, COUT;

adder4bit_test tester(.t1(A), .t2(B), .t3(CIN), .p1(S), .p2(COUT));
//                      |       |        |        ▲         ▲
//                      ▼       ▼        ▼        |         |
adder4bit       dut  (.A(A), .B(B), .Cin(CIN), .S(S), .Cout(COUT));

always @(A or B or CIN or S or COUT) begin
    #1;
    $display("%b %4b %4b %b %4b", CIN, A, B, COUT, S);
end

initial begin
    $dumpfile("tb_test_out.vcd");
    $dumpvars(0, dut);
end

endmodule