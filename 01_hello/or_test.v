`timescale 1ns/1ps

module or_test(t1, t2, p);

output t1, t2;
input p;

reg t1, t2;         // 다시 overwrite하기 전까진 값 변화 x

initial begin
    t1 <= 1'b0;
    t2 <= 1'b0;

    #100;           // 100ns 뒤에 멈춤
    t1 <= 1'b0;
    t2 <= 1'b1;

    #100;
    t1 <= 1'b1;
    t2 <= 1'b0;

    #100;
    t1 <= 1'b1;
    t2 <= 1'b1;

    #100;
    $finish;
end

endmodule