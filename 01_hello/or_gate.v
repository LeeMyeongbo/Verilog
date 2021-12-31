module or_gate (in1, in2, out);

input in1;          // 무엇이 input이고 무엇이 output인지 표시
input in2;
output out;

assign out = in1 | in2;

endmodule