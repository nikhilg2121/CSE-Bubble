module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] alu_ctrl_op,
    output reg [31:0] result,
    output wire z
);
    
assign z = (result == 32'b0);

// always @* begin
//     $display($time, "\t a: %0d, b: %0d, alu_ctrl_op: %b, result: %0d, z: %b", a, b, alu_ctrl_op, $signed(result), z);
// end

always @(*) begin
    case(alu_ctrl_op)
        4'd0: result = a & b;
        4'd1: result = a | b;
        4'd2: result = a + b;
        4'd3: result = a << b;
        4'd4: result = a >> b;
        4'd5: result = a - b;
        4'd6: result = a < b ? 1 : 0;
        4'd7: result = ~(a | b);
        4'd8: result = a != b ? 0 : 1;
        4'd9: result = a > b ? 0 : 1;
        4'd10: result = a >= b ? 0 : 1;
        4'd11: result = a < b ? 0 : 1;
        4'd12: result = a <= b ? 0 : 1;
        default: result = 32'b0;  
    endcase
end

endmodule