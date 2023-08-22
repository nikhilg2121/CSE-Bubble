`include "1_bit_alu.v"

module tt;
reg ainvert, binvert, cin, a, b, less;
    reg [1:0] s;
    wire result, cout;

smallalu uut(ainvert, binvert, cin, a, b, less, s, result, cout);

initial begin
    ainvert = 0; binvert = 0; cin = 0; a = 1; b = 1; less = 0; s = 0;
    #5;
    $finish;
end

always @* begin
    $monitor($time, "\t a = %b, b = %b, s = %b, result = %b, cout = %b", a, b, s, result, cout);
end

endmodule
