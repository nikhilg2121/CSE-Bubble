`include "program_counter.v"
`include "instr_memory.v"
`include "register_memory.v"
`include "32_bit_adder.v"
`include "shift_left2.v"
`include "control.v"
`include "sign-extend.v"
`include "mux.v"
`include "shift_left2we.v"
`include "alucontrol.v"
`include "alu.v"
`include "data_memory.v"
`include "concat.v"

module processor
(
    input wire clk
);

wire [31:0] pc;
wire [31: 0] instruction;
wire [4:0] writeRegister;       // input to registers
wire [31:0] writeData;          // input to registers
wire [31:0] readData1;          // output of registers
wire [31:0] readData2;          // output of registers
wire [31:0] extendedInstr;      // output of sign-extend
wire [31:0] ALUInput2;          // input 2 of ALU
wire [3:0] ALUCtrlOp;           // output of ALU Control
wire zeroReg;                   // zero register
wire [31:0] ALUResult;                 // output of the ALU
wire [31:0] dataMemOutput;      // read data of the memory output
wire isBranch;                  // if branch instruction and gate op
wire [31:0] shiftedLeftExtended;// output of shiftleft2we
wire [31:0] branchingFinalAddr;  // output of adder for branch instr
wire [31:0] pcAddr;              // input address to pc   
wire [31:0] pcIncremented;       // adding 4 to pc
wire pcCout;                    // carry out of pc incrementer ( no use )
wire [27:0] jumpOffset;         // output of shiftleft2 of jump offset
wire [31:0] jumpAddress;        // Jump address
wire branchCout;                // carry out of branch address adder ( no use )
wire [31:0] branchPcNext;       // output of branch or normal next pc address

wire RegDst;
wire Jump;
wire Branch;
wire MemRead;
wire MemtoReg;
wire [1:0] ALUOp;
wire MemWrite;
wire ALUSrc;
wire RegWrite;
wire [5:0] opCode;


// Calling program counter
program_counter p1(clk, pcAddr, pc);
// Making instruction memory      
instr_memory i1(clk, pc, instruction);        
// Calling control
control c1(instruction[31:26], RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, opCode); 
// Instantiating WriteRegister
mux maska1(instruction[20:16], instruction[15:11], RegDst, writeRegister);
// Making register memory
register_memory rmem1(clk, instruction[25:21], instruction[20:16], writeRegister, writeData, RegWrite, readData1, readData2);
// Sign-extending...
sign_extend se1(instruction[15:0], extendedInstr);
// Immediate or not
mux #(32) maska2(readData2, extendedInstr, ALUSrc, ALUInput2);
// Calling ALU control
alucontrol ac1(opCode, ALUOp, instruction[5:0], ALUCtrlOp);
// Calling ALU
alu a1(readData1, ALUInput2, ALUCtrlOp, ALUResult, zeroReg);
// Instantiating Data Memory
data_memory dm1(clk, ALUResult[7:0], ALUResult[7:0], MemWrite, MemRead, readData2, dataMemOutput);
// Access Data Memory or Not
mux #(32) maska3(ALUResult, dataMemOutput, MemtoReg, writeData);
// Checks for branching instruction
and(isBranch, zeroReg, Branch);
// Shifting-left sign-extended by two bits
shift_left2we sl2we1(extendedInstr, shiftedLeftExtended);
// Incrementing PC by 4
addern #(32) addn1(pc, 4, 1'd0, pcIncremented, pcCout);
// Shifting left 2 for the jump instruction address
shift_left2 sl2_1(instruction[25:0], jumpOffset);
// Getting the Jump Address
concat con1(jumpOffset, pcIncremented[31:28], jumpAddress);
// Finding the Address of the Branching Instruction
addern #(32) addn2(pcIncremented, shiftedLeftExtended, 1'b0, branchingFinalAddr, branchCout);
// Selecting branching or normal address
mux #(32) maska4(pcIncremented, branchingFinalAddr, isBranch, branchPcNext);
// Checking for jump address for pcAddr
mux #(32) maska5(branchPcNext, jumpAddress, Jump, pcAddr);

// always @* begin
//     $display ($time, "\tinstruction: %b", instruction);
//     $display ($time, "\tRegDst: %b", RegDst);
//     $display ($time, "\tJump: %b", Jump);
//     $display ($time, "\tBranch: %b", Branch);
//     $display ($time, "\tMemRead: %b", MemRead);
//     $display ($time, "\tMemtoReg: %b", MemtoReg);
//     $display ($time, "\tALUOp: %b", ALUOp);
//     $display ($time, "\tMemWrite: %b", MemWrite);
//     $display ($time, "\tALUSrc: %b", ALUSrc);
//     $display ($time, "\tRegWrite: %b", RegWrite);
//     $display ($time, "\topCode: %b", opCode);
// end

// always @* begin
//     $display ($time, "\t instr: %b, pc: %0d", instruction, pc);
// end

endmodule