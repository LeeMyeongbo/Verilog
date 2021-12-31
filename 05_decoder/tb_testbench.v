`timescale 1ns/1ps

//`define DATAFLOW_LEVEL1
`define DATAFLOW_LEVEL2

module tb_testbench;

wire [1:0] A;
wire [3:0] Y;

decoder_test tester(.t1(A), .t2(Y));
//                    |       ▲
//                    ▼       |
decoder dut        (.A(A), .Y(Y));

always @(A or Y) begin
    #1;
    $display("%2b %4b", A, Y);
end

initial begin
    $dumpfile("tb_test_out.vcd");
    $dumpvars(0, dut);
end

endmodule