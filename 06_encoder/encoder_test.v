`timescale 1ns/1ps

module encoder_test(t1, t2);

output [7:0] t1;
input  [2:0] t2;

reg [7:0] t1;

initial begin
    t1 <= 8'b0000_0001;

    #100;
    t1 <= 8'b0000_0010;

    #100;
    t1 <= 8'b0000_0100;

    #100;
    t1 <= 8'b0000_1000;

    #100;
    t1 <= 8'b0001_0000;

    #100;
    t1 <= 8'b0010_0000;

    #100;
    t1 <= 8'b0100_0000;

    #100;
    t1 <= 8'b1000_0000;

    #100;
    $finish;
end

endmodule