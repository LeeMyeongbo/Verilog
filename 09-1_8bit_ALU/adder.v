
module adder (a, b, cin, s, cout);

input  a, b, cin;
output s, cout;

`ifdef DATAFLOW_LEVEL1
assign s    = a ^ b ^ cin;
assign cout = (a & b) | (a & cin) | (b & cin); 

`elsif GATE_LEVEL
xor x0(s, a, b, cin);

wire w0, w1, w2;
and a0(w0, a, b);
and a1(w1, a, cin);
and a2(w2, b, cin);

or o0(Cout, w0, w1, w2);

`endif

endmodule