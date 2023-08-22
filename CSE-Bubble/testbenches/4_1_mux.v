module mux4
(
    input a, b, c, d,
    input wire [1:0] s,
    output reg o
);

always @* begin
    if(s==0) o = a;
    if(s==1) o = b;
    if(s==2) o = c;
    if(s==3) o = d;
end

endmodule