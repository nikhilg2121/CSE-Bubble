`include "big_alu.v"

module alu_tb;
reg [31: 0] a, b;
reg cin, ainvert, binvert;
reg [1:0] s;
wire [31:0] result;
wire cout;

big_alu uut(a, b, cin, ainvert, binvert, s, result, cout);

initial begin
    $dumpfile("big_alu.vcd");
    $dumpvars(1, alu_tb);

    #5;
    a = 5; b = 7; cin = 0; ainvert = 0; binvert = 0; s = 1;
    #5;
    s = 2;
    #5;
    cin = 1;
    #5;
    s = 1;
    #5;
    s=0;
    #5;
    $finish;
end

always @* begin
    $monitor($time, "\t a = %0d, b = %0d, s=%0d, result = %0d, cout = %b", a, b, s, result, cout);
end

endmodule