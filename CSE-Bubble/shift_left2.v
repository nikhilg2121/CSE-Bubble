module shift_left2
#(
    parameter N = 26
)
(
    input wire [N-1:0] in,
    output wire [N+1:0] out
);

assign out = {in, 2'b00};

endmodule