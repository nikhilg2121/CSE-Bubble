module mem
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
    output wire [4*B-1:0] r_data1,
    output wire [4*B-1:0] r_data2
);

reg [B-1 : 0] mem [0 : 1023];

assign r_data1 = {mem[r_addr1], mem[r_addr1 + 1], mem[r_addr1 + 2], mem[r_addr1 + 3]};
assign r_data2 = {mem[r_addr2], mem[r_addr2 + 1], mem[r_addr2 + 2], mem[r_addr2 + 3]};

initial begin
    mem[0] = 8'b00000100;
	mem[1] = 8'b00001000;
	mem[2] = 8'b00000000;
	mem[3] = 8'b00000101;
	mem[4] = 8'b00000100;
	mem[5] = 8'b00001001;
	mem[6] = 8'b00000000;
	mem[7] = 8'b00000001;
	mem[8] = 8'b00000100;
	mem[9] = 8'b00001010;
	mem[10] = 8'b00000000;
	mem[11] = 8'b00000001;
	mem[12] = 8'b00100001;
	mem[13] = 8'b01001000;
	mem[14] = 8'b00000000;
	mem[15] = 8'b00001011;
	mem[16] = 8'b00000001;
	mem[17] = 8'b01000011;
	mem[18] = 8'b01110000;
	mem[19] = 8'b10000111;
	mem[20] = 8'b00000000;
	mem[21] = 8'b00001110;
	mem[22] = 8'b01100000;
	mem[23] = 8'b00000001;
	mem[24] = 8'b00000001;
	mem[25] = 8'b10000010;
	mem[26] = 8'b01101000;
	mem[27] = 8'b00000010;
	mem[28] = 8'b00011001;
	mem[29] = 8'b10001011;
	mem[30] = 8'b00000000;
	mem[31] = 8'b00000000;
	mem[32] = 8'b00011001;
	mem[33] = 8'b10101110;
	mem[34] = 8'b00000000;
	mem[35] = 8'b00000000;
	mem[36] = 8'b00110101;
	mem[37] = 8'b11001011;
	mem[38] = 8'b00000000;
	mem[39] = 8'b00000011;
	mem[40] = 8'b00011101;
	mem[41] = 8'b10001110;
	mem[42] = 8'b00000000;
	mem[43] = 8'b00000000;
	mem[44] = 8'b00011101;
	mem[45] = 8'b10101011;
	mem[46] = 8'b00000000;
	mem[47] = 8'b00000000;
	mem[48] = 8'b00000000;
	mem[49] = 8'b00000000;
	mem[50] = 8'b01001000;
	mem[51] = 8'b00000001;
	mem[52] = 8'b00000101;
	mem[53] = 8'b01001010;
	mem[54] = 8'b00000000;
	mem[55] = 8'b00000001;
	mem[56] = 8'b00111000;
	mem[57] = 8'b00000000;
	mem[58] = 8'b00000000;
	mem[59] = 8'b00000011;
	mem[60] = 8'b00100100;
	mem[61] = 8'b00001001;
	mem[62] = 8'b00000000;
	mem[63] = 8'b00000010;
	mem[64] = 8'b00000001;
	mem[65] = 8'b00000001;
	mem[66] = 8'b01000000;
	mem[67] = 8'b00000010;
	mem[68] = 8'b00111000;
	mem[69] = 8'b00000000;
	mem[70] = 8'b00000000;
	mem[71] = 8'b00000001;
end

always @(posedge clk) begin
    if(write_en) begin
        mem[w_addr] <= w_data[31:24];
        mem[w_addr + 1] <= w_data[23:16];
        mem[w_addr + 2] <= w_data[15:8];
        mem[w_addr + 3] <= w_data[7:0];
    end
end

// always @* begin
// // $display($time, "\t r_addr1: %b, r_data1: %b, %b, %b",r_addr1+3, mem[1], mem[r_addr1+2], mem[r_addr1+3]);
// end

endmodule