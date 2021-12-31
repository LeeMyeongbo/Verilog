
module demux (F, sel, A, B, C, D);

input       F;
input [1:0] sel;
output      A, B, C, D;

`ifdef DATAFLOW_LEVEL1
assign A = F & (~sel[1] & ~sel[0]);
assign B = F & (~sel[1] &  sel[0]);
assign C = F & ( sel[1] & ~sel[0]);
assign D = F & ( sel[1] &  sel[0]);

`elsif DATAFLOW_LEVEL2


`endif

endmodule