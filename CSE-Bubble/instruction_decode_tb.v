`include "instruction_decode.v"

module instruction_decode_tb;

reg clk;
reg [31:0] pc;
wire [1:0] type;

decoded uut(clk, pc, type);

always @* begin
    #2; clk <= ~clk;
    $display("pc: %d, type: %d", pc, type);
end

initial begin
    clk <= 0;
    pc <=1;
    #5;
    pc <= 3;
    #5;
    pc <= 18;
    #5;
    $finish;
end

endmodule