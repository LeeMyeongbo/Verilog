
module decoder (A, Y);

input  [1:0] A;
output [3:0] Y;

`ifdef DATAFLOW_LEVEL1
assign Y[0] = (~A[1] & ~A[0]);
assign Y[1] = (~A[1] &  A[0]);
assign Y[2] = ( A[1] & ~A[0]);
assign Y[3] = ( A[1] &  A[0]);

`elsif DATAFLOW_LEVEL2          // 대입연산자를 이용한 decoder 설계
assign Y[0] = (A == 2'b00);
assign Y[1] = (A == 2'b01);
assign Y[2] = (A == 2'b10);
assign Y[3] = (A == 2'b11);

`endif

endmodule