`include "4_1_mux.v"
`include "adder.v"
`include "mux.v"

module smallalu
(
    input ainvert, binvert, cin, a, b, less,
    input wire [1:0] s,
    output result, cout
);

wire t0, t1, t2, t3, t4, t5, t6;
wire a_bar, b_bar;

not(a_bar, a);
mux m1(a, a_bar, ainvert, t0);

not(b_bar, b);
mux m2(b, b_bar, binvert, t1);

and (t2, t0, t1);
or (t3, t0, t1);
adder a1(t0, t1, cin, t4, cout);

mux4 mm(t2, t3, t4, less, s, result);

endmodule