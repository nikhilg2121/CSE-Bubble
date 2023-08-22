`include "adder.v"

module addern
#(
    parameter N = 8
) 
(
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire cin,
    output wire [N-1:0] s,
    output wire cout
);

wire [N-1:0] temp;

adder a1(a[0], b[0], cin, s[0], temp[0]);
genvar i;
generate
    for(i = 1; i < N; i=i+1) begin
        adder a2(a[i], b[i], temp[i-1], s[i],temp[i]);
    end
endgenerate

assign cout = temp[N-1];

endmodule