module control
(
    input wire [5:0] opcode,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output wire [5:0] opCode
);

assign opCode = opcode;

always @* begin
    if(opcode == 0) begin
        RegDst = 1;
        Jump = 0;
        Branch = 0;
        MemRead = 0;
        MemtoReg = 0;
        ALUOp = 2'd3;
        MemWrite = 0;
        ALUSrc = 0;
        RegWrite = 1;
    end
    else if(opcode >= 1 && opcode <= 5) begin
        RegDst = 0;
        Jump = 0;
        Branch = 0;
        MemRead = 0;
        MemtoReg = 0;
        ALUOp = 1;
        MemWrite = 0;
        ALUSrc = 1;
        RegWrite = 1;
    end
    else if(opcode == 6) begin
        RegDst = 0;
        ALUSrc = 1;
        MemtoReg = 1;
        RegWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 2'b01;
        Jump = 0;
    end
    else if(opcode == 7) begin
        RegDst = 0;
        ALUSrc = 1;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 1;
        Branch = 0;
        ALUOp = 01;
        Jump = 0;
    end
    // else if(opcode == 8) begin
    //     RegDst = 0;
    //     ALUSrc = 0;
    //     MemtoReg = 0;
    //     RegWrite = 0;
    //     MemRead = 0;
    //     MemWrite = 0;
    //     Branch = 1;
    //     ALUOp = 00;
    //     Jump = 0;
    // end
    else if(opcode >= 8 && opcode <=13) begin
        RegDst = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        ALUOp = 00;
        Jump = 0;
    end
    else if(opcode >= 14 && opcode <=16) begin
        RegDst = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 10;
        Jump = 1;
    end
end

endmodule