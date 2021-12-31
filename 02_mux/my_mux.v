//         _____
//  a --> | mux |
//  b --> |_____| --> out : when sel is 1, out is b
//           |
//    sel -- +

module my_mux (a, b, sel, out);

input a, b, sel;
output out;

`ifdef GATE_LEVEL
wire selb, out1, out2;
not i1(selb, sel);          // 출력 : selb, 입력 : sel (sel를 invert함)
and a1(out1, a, selb);      // out1 = a & !sel
and a2(out2, b, sel);       // out2 = b & sel
or o1(out, out1, out2);     // out = out1 | out2

`elsif DATAFLOW_LEVEL       // RTL Llevel implementation
assign out = sel ? b : a;
`endif

endmodule