`timescale 1ns/1ps

module ALU_test(t1, t2, t3, p1);

output       t1, t2;
output [1:0] t3;
input        p1;

reg       t1, t2;
reg [1:0] t3;

initial begin
    t1 <= 1'b1; t2 <= 1'b0;
    t3 <= 2'b00;

    #100;
    t3 <= 2'b01;

    #100;
    t3 <= 2'b10;

    #100;
    t3 <= 2'b11;

    #100;
    $finish;
end

endmodule