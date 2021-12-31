`timescale 1ns/1ps

module mux_test(t1, t2, t3, p);

output t1, t2, t3;
input p;

reg t1, t2, t3;         // 다시 overwrite하기 전까진 값 변화 x

initial begin
    // a, b forcing (a, b 인가)
    t1 <= 1;
    t2 <= 0;

    t3 <= 0;    // select a

    #100;
    t3 <= 1;    // select b

    #100;
    t3 <= 0;    // select a

    #100;
    $finish;
end

endmodule