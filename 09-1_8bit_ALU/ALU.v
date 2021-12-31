
module ALU (a, b, ALUCtrl, res);

input  [7:0] a, b;
input  [1:0] ALUCtrl;
output [7:0] res;

`ifdef DATAFLOW_LEVEL1
wire [7:0] _b, s, c;
assign _b = ALUCtrl[0] ? ~b : b;      // !B : B가 0이 아니면 0으로 만듦, ~B : B의 각 bit를 inversion시킴

adder add0(.a(a[0]), .b(_b[0]), .cin(ALUCtrl[0]), .s(s[0]), .cout(c[0]));
adder add1(.a(a[1]), .b(_b[1]), .cin(c[0]      ), .s(s[1]), .cout(c[1]));
adder add2(.a(a[2]), .b(_b[2]), .cin(c[1]      ), .s(s[2]), .cout(c[2]));
adder add3(.a(a[3]), .b(_b[3]), .cin(c[2]      ), .s(s[3]), .cout(c[3]));
adder add4(.a(a[4]), .b(_b[4]), .cin(c[3]      ), .s(s[4]), .cout(c[4]));
adder add5(.a(a[5]), .b(_b[5]), .cin(c[4]      ), .s(s[5]), .cout(c[5]));
adder add6(.a(a[6]), .b(_b[6]), .cin(c[5]      ), .s(s[6]), .cout(c[6]));
adder add7(.a(a[7]), .b(_b[7]), .cin(c[6]      ), .s(s[7]), .cout(c[7]));

wire [7:0] res_AND, res_OR;
assign res_AND = a & b;
assign res_OR = a | b;

assign res = !ALUCtrl[1] ? s : !ALUCtrl[0] ? res_AND : res_OR;

`elsif GATE_LEVEL

`endif

endmodule