//         _____
//  a --> | mux |
//  b --> |_____| --> out : when sel is 1, out is b
//           |
//    sel -- +

module mux4x1 (in, sel, out);

input [3:0] in;
input [1:0] sel;
output out;

`ifdef GATE_LEVEL
wire [1:0] selb;
not i0(selb[0], sel[0]);
not i1(selb[1], sel[1]);

wire [3:0] in_gated;
and a0(in_gated[0], in[0], selb[1], selb[0]);
and a1(in_gated[1], in[1], selb[1],  sel[0]);
and a2(in_gated[2], in[2],  sel[1], selb[0]);
and a3(in_gated[3], in[3],  sel[1],  sel[0]);

or o1(out, in_gated[0], in_gated[1], in_gated[2], in_gated[3]);

`elsif DATAFLOW_LEVEL1
wire IN0_GATED = in[0] & (~sel[1] & ~sel[0]);       // ~가 not의 의미 (C언어의 !와 비슷)
wire IN1_GATED = in[1] & (~sel[1] &  sel[0]);
wire IN2_GATED = in[2] & ( sel[1] & ~sel[0]);
wire IN3_GATED = in[3] & ( sel[1] &  sel[0]);

assign out = IN0_GATED | IN1_GATED | IN2_GATED | IN3_GATED;

`endif

endmodule