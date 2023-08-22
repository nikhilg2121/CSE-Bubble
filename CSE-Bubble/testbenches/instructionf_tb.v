`include "instruction_fetch.v"

module ttt;

reg clk; reg[7:0] pc;
wire [31:0] data;

fetch_instr uut(clk, pc, data);

always @* begin
    clk = ~clk;
    #1;
    $monitor($time, "\t pc: %0d, data = %b", pc, data);
end


initial begin
    pc = 0;
    clk = 0;
    #5;
    $finish;
end

endmodule
