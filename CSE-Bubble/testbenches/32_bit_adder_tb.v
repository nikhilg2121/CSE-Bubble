`include "32_bit_adder.v"

module tt;

reg [31:0] a, b;
reg cin;
wire [31:0] c;
wire cout;

addern #(32) ad(a, b, cin, c, cout);

initial begin
    $dumpfile("32_bit_adder.vcd");
    $dumpvars(1, tt);

    // #5;
    a = 2;b=3;cin=0;
    #5;
    cin=1;
    #5;
    b = 6;
    #5;
    a=4;
    #5;
    cin=0;
    #5;
    $finish;
end

always @* begin
    $monitor($time, "\t a = %0d, b = %0d, cin = %b, c = %0d, cout = %b", a, b, cin, c, cout);
end

endmodule