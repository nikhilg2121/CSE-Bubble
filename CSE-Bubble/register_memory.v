module register_memory
#(
    parameter B = 32,
    parameter N = 5
)
(
    input wire clk,
    input wire [N-1:0] r_addr1,
    input wire [N-1:0] r_addr2,
    input wire [N-1:0] w_addr,
    input wire [B-1:0] w_data,
    input wire write_en,
    output wire [B-1:0] r_data1,
    output wire [B-1:0] r_data2
);

reg [B-1 : 0] mem [0 : 2**(N)-1];

assign r_data1 = mem[r_addr1];
assign r_data2 = mem[r_addr2];

initial begin
    mem[0] = 0;
    mem[1] = 1;
    mem[2] = 4;
    mem[3] = 2;
    // mem[1] = 15;
end

always @(posedge clk) begin
    if(write_en) begin
        mem[w_addr] = w_data;
        // $display($time, "\t %0d, %0d", w_addr, mem[w_addr]);
    end
end

// always @* begin
//     $display($time, "\t value at address %d: %d", r_addr1, $signed(mem[r_addr1]));
// end

endmodule