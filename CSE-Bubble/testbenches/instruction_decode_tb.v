`include "Instruction_decode.v"

module decode_tb;

reg [7: 0] pc;
wire [1:0] type;

instr_decode uut(pc, type);

initial begin
    $dumpfile("instruction_decode.vcd");
    $dumpvars(1, decode_tb);

    pc = 0;
    #5;
    pc = 4;
    #5;
    pc = 2;
    #5;
    pc = 3;
    #5;
    $finish;
end

always @* begin
    $monitor($time, "\tpc: %0d, type = %0d", pc, type);
end

endmodule