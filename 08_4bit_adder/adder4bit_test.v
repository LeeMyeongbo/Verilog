`timescale 1ns/1ps

module adder4bit_test(t1, t2, t3, p1, p2);

output [3:0] t1, t2;
output       t3;
input  [3:0] p1;
input        p2;

reg [3:0] t1, t2;
reg       t3;

initial begin
    t1 <= 4'b0011; t2 <= 4'b0001; t3 <= 1'b0;

    #100;
    t1 <= 4'b1100; t2 <= 4'b0011; t3 <= 1'b1;

    #100;
    $finish;
end

endmodule