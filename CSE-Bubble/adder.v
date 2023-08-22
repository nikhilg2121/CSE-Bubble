module adder
(
    input a, b, cin, 
    output c, cout
);

wire t1, t2, t3;

xor(t1, a, b);
xor(c, t1, cin);

and(t2, a, b);
and(t3, t1, cin);
or(cout, t2, t3);


endmodule