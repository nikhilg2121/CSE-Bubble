module mux
#(
    parameter N = 5
)
(
    input wire [N-1: 0] a, b,
    input wire s,
    output reg [N-1: 0]c
);

always @* begin
    if(s==0) c = a;
    else c = b;
end

endmodule