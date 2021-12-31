
module encoder (A, Y);

input  [7:0] A;
output [2:0] Y;

`ifdef DATAFLOW_LEVEL1
assign Y[2] = A[7] | A[6] | A[5] | A[4]                     ;
assign Y[1] = A[7] | A[6]               | A[3] | A[2]       ;
assign Y[0] = A[7]        | A[5]        | A[3]        | A[1];

`elsif DATAFLOW_LEVEL2          // 비교연산자를 이용한 decoder 설계
assign Y = (A == 8'b0000_0001) ? 3'b000 : 
           (A == 8'b0000_0010) ? 3'b001 : 
           (A == 8'b0000_0100) ? 3'b010 :
           (A == 8'b0000_1000) ? 3'b011 :
           (A == 8'b0001_0000) ? 3'b100 :
           (A == 8'b0010_0000) ? 3'b101 :
           (A == 8'b0100_0000) ? 3'b110 :
           (A == 8'b1000_0000) ? 3'b111 : 3'b000;

`elsif DATAFLOW_LEVEL3
reg [2:0] Y;

always @ (A) begin
    case(A)
        8'b0000_0001: 
            Y <= 3'b000;
        8'b0000_0010: 
            Y <= 3'b001;
        8'b0000_0100: 
            Y <= 3'b010;
        8'b0000_1000: 
            Y <= 3'b011;
        8'b0001_0000: 
            Y <= 3'b100;
        8'b0010_0000: 
            Y <= 3'b101;
        8'b0100_0000: 
            Y <= 3'b110;
        8'b1000_0000: 
            Y <= 3'b111;
        default: 
            Y <= 3'b000;
    endcase
end

`endif

endmodule