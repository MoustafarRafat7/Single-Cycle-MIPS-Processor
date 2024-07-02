module Control_Unit
(
input [5:0]Opcode,
input [5:0]Funct,
output [2:0]ALUControl,
output jump,memwrite,regwrite,regdest,alusrc,memtoreg,branch
);

wire [1:0]ALUOp;
Main_Decoder main_decoder(.Opcode(Opcode),.ALUOp(ALUOp),.jump(jump),.memwrite(memwrite),.regwrite(regwrite),.regdest(regdest),.alusrc(alusrc),
                     .memtoreg(memtoreg),.branch(branch));
ALU_Decoder ALu_Decoder(.ALUOp(ALUOp),.Funct(Funct),.ALUControl(ALUControl));
endmodule
