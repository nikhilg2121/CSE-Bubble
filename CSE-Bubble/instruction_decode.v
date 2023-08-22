`include "instruction_fetch.v"

module decoded(
    input wire clk,
    input wire [31:0] pc,
    output reg [1:0] type
);


wire [5:0] opCode;
wire [31:0] instruction;
fetch_instr f1(clk, pc, instruction);
assign opCode = instruction[31:26];

always @* begin
    if(opCode==0) begin
        type = 2'b00;
    end
    else if (opCode >= 1 && opCode <= 13) begin
        type = 2'b01;
    end
    else begin
        type = 2'b10;
    end
end

endmodule