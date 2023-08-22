`include "1_bit_alu.v"

module big_alu(
    input wire [31: 0] a,
    input wire [31: 0] b,
    input wire cin,
    input wire Ainvert, Binvert,
    input wire [1:0] s,
    output wire [31: 0] result,
    output wire cout
);

wire [31: 0] temp;

smallalu ss(Ainvert, Binvert, cin, a[0], b[0], 1'b0, s, result[0], temp[0]);

genvar i;

generate
for( i = 1; i<32; i= i+1) begin
    smallalu s1(Ainvert, Binvert, temp[i-1], a[i],b[i],1'b0, s, result[i], temp[i]);
end
endgenerate

assign cout = temp[31];


endmodule