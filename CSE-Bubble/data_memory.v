`include "dmemory.v"

module data_memory
#(
    parameter B = 8,
    parameter N = 8
)
(
    input wire clk,
    input wire [N-1 : 0] r_addr,
    input wire [N-1 : 0] w_addr,
    input wire w_en,
    input wire r_en,
    input wire [4*B-1 : 0] w_data,
    output wire [4*B-1 : 0] r_data
);

wire[31:0] temp;

dmemory dmem(clk, r_addr, 8'b0, w_addr, w_data, w_en, r_en, r_data, temp);

// always @* begin
//     $display($time, "\t r_addr = %0d, w_addr = %0d, w_data = %0d, w_en = %b", r_addr,w_addr, w_data, w_en);
// end

endmodule