`include "adder.v"

module tt;
reg a, b, cin;
wire c, cout;

adder ad(a, b, cin, c, cout);

initial begin
    $dumpfile("adder.vcd");
    $dumpvars(1, tt);

    a = 0;b=0;cin=0;
    #5;
    cin=1;
    #5;
    b = 1;
    #5;
    a=1;
    #5;
    cin=0;
    #5;
    $finish;
end


endmodule