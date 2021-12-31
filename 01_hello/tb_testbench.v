module tb_testbench;

wire n1, n2, n3;                // 연결다리 wire

or_test tester(n1, n2, n3);
or_gate dut(n1, n2, n3);        // tester의 n1, n2가 dut의 n1, n2로 가고 dut의 n3가 tester의 n3로 감

always @(n1, n2, n3) begin
    $display("%b %b %b", n1, n2, n3);
end

initial begin
    $dumpfile("tb_test_out.vcd");
    $dumpvars(0, dut);
end

endmodule