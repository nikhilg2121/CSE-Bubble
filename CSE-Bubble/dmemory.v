module dmemory
#(
    parameter B = 8,
    parameter N = 8
)
(
    input wire clk,
    input wire [N-1:0] r_addr1,
    input wire [N-1:0] r_addr2,
    input wire [N-1:0] w_addr,
    input wire [4*B-1:0] w_data,
    input wire write_en,
    input wire read_en,
    output reg [4*B-1:0] r_data1,
    output wire [4*B-1:0] r_data2
);

reg [B-1 : 0] mem [0 : 2**(N)-1];

assign r_data2 = {mem[r_addr2], mem[r_addr2 + 1], mem[r_addr2 + 2], mem[r_addr2 + 3]};

always @* begin
    if(read_en) begin
        r_data1 = {mem[r_addr1], mem[r_addr1 + 1], mem[r_addr1 + 2], mem[r_addr1 + 3]};
    end
    $display($time, "\t %0d, %0d, %0d, %0d, %0d",  mem[3], mem[7], mem[11], mem[15], mem[19]);
end


initial begin
    mem[0] = 8'b00000000;
	mem[1] = 8'b00000000;
	mem[2] = 8'b00000000;
	mem[3] = 8'b00000011;
	mem[4] = 8'b00000000;
	mem[5] = 8'b00000000;
	mem[6] = 8'b00000000;
	mem[7] = 8'b00000101;
	mem[8] = 8'b00000000;
	mem[9] = 8'b00000000;
	mem[10] = 8'b00000000;
	mem[11] = 8'b00000010;
	mem[12] = 8'b00000000;
	mem[13] = 8'b00000000;
	mem[14] = 8'b00000000;
	mem[15] = 8'b00000001;
	mem[16] = 8'b00000000;
	mem[17] = 8'b00000000;
	mem[18] = 8'b00000000;
	mem[19] = 8'b00000100;
end

// 00000100000010000000000000000101
// 00000100000010010000000000000001
// 00000100000010100000000000000001
// 00100001010010000000000000001011
// 00000000000010100111000010000111
// 00000000000011100110000000000001
// 00000001100000100110100000000010
// 00011001100010110000000000000000
// 00011001101011100000000000000000
// 00110101110010110000000000000011
// 00011101100011100000000000000000
// 00101101101010110000000000000000
// 00000000000000000100100000000001
// 00000101010010100000000000000001
// 00111000000000000000000000000011
// 00100100000010010000000000000010
// 00000001000000010100000000000010
// 00111000000000000000000000000001

always @(posedge clk) begin
    if(write_en) begin
        mem[w_addr] <= w_data[31:24];
        mem[w_addr + 1] <= w_data[23:16];
        mem[w_addr + 2] <= w_data[15:8];
        mem[w_addr + 3] <= w_data[7:0];
    end
end

endmodule