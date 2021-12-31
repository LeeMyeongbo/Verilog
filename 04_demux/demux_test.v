`timescale 1ns/1ps

module demux_test(t1, t2, p1, p2, p3, p4);

output t1;
output [1:0] t2;
input p1, p2, p3, p4;

reg t1;
reg [1:0] t2;

initial begin
    t1 <= 1'b1;
    t2 <= 2'b00;        // select sel[0] (=00)

    #100;
    t2 <= 2'b01;        // select sel[1] (=01)

    #100;
    t2 <= 2'b10;        // select sel[2] (=10)

    #100;
    t2 <= 2'b11;        // select sel[3] (=11)

    #100;
    $finish;
end

endmodule