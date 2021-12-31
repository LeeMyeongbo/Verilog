`timescale 1ns/1ps

module mux4x1_test(t1, t2, p);

output [3:0] t1;
output [1:0] t2;
input p;

reg [3:0] t1;           // reg [msb:lsb] r1 : verilog에서의 vector(msb : most significant bit, lsb : least significant bit)
reg [1:0] t2;

initial begin
    t1 <= 4'b0101;      // b[0] : 1, b[1] : 0, b[2] : 1, b[3] : 0
    t2 <= 2'b00;        // select in[0]

    #100;
    t2 <= 2'b01;        // select in[1]

    #100;
    t2 <= 2'b10;        // select in[2]

    #100;
    t2 <= 2'b11;        // select in[3]

    #100;
    $finish;
end

endmodule