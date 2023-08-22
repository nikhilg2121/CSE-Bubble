module alucontrol
(
    input [5:0] opcode,
    input [1:0] ALUOp,
    input [5:0] func,
    output reg [3:0] alu_ctrl_op
);

always@(*) begin
    // $display($time, "\t opcode: %b, ALUOp: %0b, func: %0d, alu_ctrl_op: %b", opcode, ALUOp, func, alu_ctrl_op);
    if(ALUOp == 3)begin
        if(func == 1) begin
            alu_ctrl_op = 4'd2;
        end
        else if(func == 2) begin
            alu_ctrl_op = 4'd5;
        end
        else if(func == 3) begin
            alu_ctrl_op = 4'd2;
        end
        else if(func == 4) begin
            alu_ctrl_op = 4'd5;
        end
        else if(func == 5) begin
            alu_ctrl_op = 4'd0;
        end
        else if(func == 6) begin
            alu_ctrl_op = 4'd1;
        end
        else if(func == 7) begin
            alu_ctrl_op = 4'd3;
        end
        else if(func == 8) begin
            alu_ctrl_op = 4'd4;
        end
        else if(func == 9) begin
            alu_ctrl_op = 4'd6;
        end
    end
    else if (ALUOp == 1) begin
        case (opcode)
            6'd1: alu_ctrl_op = 4'd2;
            6'd2: alu_ctrl_op = 4'd2;
            6'd3: alu_ctrl_op = 4'd0;
            6'd4: alu_ctrl_op = 4'd1;
            6'd5: alu_ctrl_op = 4'd6;
            6'd6: alu_ctrl_op = 4'd2;
            6'd7: alu_ctrl_op = 4'd2;
        endcase
    end
    else if (ALUOp == 0) begin
        case (opcode)
            6'd8: alu_ctrl_op = 4'd5;
            6'd9: alu_ctrl_op = 4'd8;
            6'd10: alu_ctrl_op = 4'd9;
            6'd11: alu_ctrl_op = 4'd10;
            6'd12: alu_ctrl_op = 4'd11;
            6'd13: alu_ctrl_op = 4'd12;
        endcase
    end
    else if (ALUOp == 2) begin
        alu_ctrl_op = 4'd13;
    end
end

endmodule