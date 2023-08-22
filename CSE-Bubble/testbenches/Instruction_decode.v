`include "instruction_fetch.v"

module instr_decode
#(
    parameter B = 32,
    parameter N = 8
)
(
    input wire [N-1 : 0] pc,
    output reg [1 : 0] type
);

wire [B-1: 0] instruction;
fetch_instr inst(pc, instruction);

wire [5 : 0] opcode;

assign opcode = instruction[31: 26];

always @* begin
    if(opcode == 0) begin
        type = 2'b0;
    end
    else if (opcode == 1) begin
        type = 2'b1;
    end
    else if (opcode == 2) begin
        type = 2;
    end
end


endmodule