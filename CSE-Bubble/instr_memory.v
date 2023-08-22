`include "memory.v"

module instr_memory
#(
    parameter B = 8,
    parameter N = 32
)
(
    input wire clk,
    input wire [N-1 : 0] r_addr,
    output wire [4*B-1 : 0] instr
);

wire [4*B-1:0] temp;
mem #(.B(8), .N(32)) imem(clk, r_addr, 32'b0, 32'b0, 32'd3, 1'b0, instr, temp);

// always @* begin
// // $display($time, "\t read_a: %b instr: %b",r_addr, instr);
// end
endmodule