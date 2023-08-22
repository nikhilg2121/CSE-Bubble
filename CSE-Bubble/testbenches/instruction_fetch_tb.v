`include "instruction_fetch.v"

module instr_tb;

reg [7: 0] pc;
wire [31:0] instruction;

fetch_instr uut(pc, instruction);

initial begin
    $dumpfile("instruction_fetch.vcd");
    $dumpvars(1, instr_tb);

    pc = 0;
    #5;
    pc = 4;
    #5;
    $finish;
end

always @* begin
    $monitor($time, "\tpc: %0d, instruction = %0d", pc, instruction);
end

endmodule