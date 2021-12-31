`timescale 1ns/1ps

//`define DATAFLOW_LEVEL1
//`define DATAFLOW_LEVEL2
`define DATAFLOW_LEVEL3

module tb_testbench;

wire [7:0] A;
wire [2:0] Y;

encoder_test tester(.t1(A), .t2(Y));
//                    |       ▲
//                    ▼       |
encoder dut        (.A(A), .Y(Y));

always @(A or Y) begin
    #1;
    $display("%8b %3b", A, Y);
end

initial begin
    $dumpfile("tb_test_out.vcd");
    $dumpvars(0, dut);
end

endmodule