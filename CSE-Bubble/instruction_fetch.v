`include "instr_memory.v"

module fetch_instr
#(
    parameter B = 32,
    parameter N = 8
)
(
    input wire clk,
    input wire [N-1:0] pc,
    output wire [B-1:0] instruction
);

instr_memory m1(clk, pc, instruction);

endmodule