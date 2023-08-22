`include "data_memory.v"

module dmemtb;

parameter N = 8, B = 8;

reg clk;
reg [N-1 : 0] r_addr;
reg [N-1 : 0] w_addr;
reg w_en;
reg r_en;
reg [4*B-1 : 0] w_data;
wire [4*B-1 : 0] r_data;

d_mem dd(clk, r_addr, w_addr, w_en, r_en, w_data, r_data);

always @* begin
    #1; clk <= ~clk;
    // $monitor($time, "\t clk = %b, r_addr: %b, data: %0d",clk,  r_addr, r_data);
end

initial begin
    $dumpfile("dmem.vcd");
    $dumpvars(1, dmemtb);
    clk = 0;
    #3;
    w_addr <= 3;
    w_en <= 1;
    w_data <= 25;
    #6;
    r_addr <= 3;
    w_en <= 0;
    #5;
    r_en = 1;
    #4;
    $finish;
end

endmodule