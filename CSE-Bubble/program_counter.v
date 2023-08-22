module program_counter
(
    input clk,
    input [31:0] addr,
    output reg [31:0] pc
);

initial begin
    pc = 0;
end
    
always @(posedge clk) begin
    pc <= addr;
end

endmodule