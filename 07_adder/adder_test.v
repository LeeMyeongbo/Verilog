`timescale 1ns/1ps

module adder_test(t1, t2, t3, p1, p2);

output t1, t2, t3;
input  p1, p2;

reg t1, t2, t3;

initial begin
    t1 <= 1'b0; t2 <= 1'b0; t3 <= 1'b0;

    #100;
    t1 <= 1'b0; t2 <= 1'b0; t3 <= 1'b1;

    #100;
    t1 <= 1'b0; t2 <= 1'b1; t3 <= 1'b0;

    #100;
    t1 <= 1'b0; t2 <= 1'b1; t3 <= 1'b1;

    #100;
    t1 <= 1'b1; t2 <= 1'b0; t3 <= 1'b0;

    #100;
    t1 <= 1'b1; t2 <= 1'b0; t3 <= 1'b1;

    #100;
    t1 <= 1'b1; t2 <= 1'b1; t3 <= 1'b0;

    #100;
    t1 <= 1'b1; t2 <= 1'b1; t3 <= 1'b1;

    #100;
    $finish;
end

endmodule