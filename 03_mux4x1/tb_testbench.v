`timescale 1ns/1ps
`define GATE_LEVEL
//`define DATAFLOW_LEVEL1

module tb_testbench;

wire [3:0] data;
wire [1:0] sel;
wire       out;

mux4x1_test tester(.t1(data), .t2(sel), .p(out));
//                   |          |         ▲
//                   ▼          ▼         |
mux4x1 dut     (.in(data), .sel(sel), .out(out));       // .의 역할 : 한 변수를 어느 변수에 넣을지 명시적으로 표시(named matching)

always @(data, sel, out) begin
    #1;
    $display("%4b %2b %b", data, sel, out);
end

initial begin
    $dumpfile("tb_test_out.vcd");
    $dumpvars(0, dut);
end

endmodule