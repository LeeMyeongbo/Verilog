del tb_test_out.vvp tb_test_out.vcd
iverilog -o tb_test_out.vvp tb_testbench.v decoder.v decoder_test.v
vvp tb_test_out.vvp
gtkwave tb_test_out.vcd