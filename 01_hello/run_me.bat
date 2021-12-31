iverilog -o tb_test_out.vvp or_gate.v or_test.v tb_testbench.v
vvp tb_test_out.vvp
gtkwave tb_test_out.vcd