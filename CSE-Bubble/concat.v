module concat(
    input wire [27:0] a,
    input wire [3:0] b,
    output wire [31:0] c
);

assign c = {b, a};

endmodule