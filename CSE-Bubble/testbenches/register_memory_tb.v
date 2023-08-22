`include "register_memory.v"

module chekc;

parameter N = 5, B = 32;

reg clk;
reg [N-1:0] r_addr1;
reg [N-1:0] r_addr2;
reg [N-1:0] w_addr;
reg [B-1:0] w_data;
reg write_en;
wire [B-1:0] r_data1;
wire [B-1:0] r_data2;

always @* begin
    #1; clk <= ~clk;
end

rmem dfas(clk, r_addr1, r_addr2, w_addr, w_data, write_en, r_data1, r_data2);

initial begin
    $dumpfile("check.vcd");
    $dumpvars(1, chekc);
    clk = 0;
    r_addr1 = 3;
    r_addr2 = 2;
    #2;
    w_data = 34;
    w_addr = 3;
    write_en = 1;
    #4;
    w_addr = 2;
    w_data = 7;
    #4;
    write_en = 1;
    #2;
    $finish;
end

endmodule