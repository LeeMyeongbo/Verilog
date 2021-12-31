`timescale 1ns/1ps
//`define GATE_LEVEL
`define DATAFLOW_LEVEL1

module tb_testbench;

wire F, A, B, C, D;
wire [1:0] SEL;

demux_test tester(.t1(F), .t2(SEL), .p1(A), .p2(B), .p3(C), .p4(D));
//                  |         |        ▲      ▲      ▲       ▲
//                  ▼         ▼        |      |      |       |
demux dut        (.F(F), .sel(SEL), .A(A), .B(B), .C(C), .D(D));

always @(F or SEL or A or B or C or D) begin
    #1;
    $display("%b %2b %b %b %b %b", F, SEL, A, B, C, D);
end

initial begin
    $dumpfile("tb_test_out.vcd");
    $dumpvars(0, dut);
end

endmodule