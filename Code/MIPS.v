module MIPS
(
 input clk,
 input reset,
 output [15:0]test_value
);
wire jump,memwrite,regwrite,regdest,alusrc,memtoreg,branch;
wire [2:0]ALUControl;
wire PCSrc;
wire Zero;
wire [4:0]WriteReg;
wire [27:0]jump_address;
wire [31:0]PCbranch,PCplus4,PC_MUX1_OUT,PCJump,PC_Next_State,PC_Current_State;
wire [31:0]instruction;
wire [31:0]Result,ReadData;
wire [31:0]RD1,RD2;
wire [31:0]SignImm;
wire [31:0]SrcA,SrcB,ALUResult;
wire [31:0]Shifted_SignImm;

MUX #(.width(32)) branch_Mux(.input0(PCplus4),.input1(PCbranch),.selector(PCSrc),.out(PC_MUX1_OUT));
MUX #(.width(32)) Jump_Mux(.input0(PC_MUX1_OUT),.input1(PCJump),.selector(jump),.out(PC_Next_State));
MUX #(.width(5)) A3_Dest_Mux(.input0(instruction[20:16]),.input1((instruction[15:11])),.selector(regdest),.out(WriteReg));
MUX #(.width(32)) ALU_Mux(.input0(RD2),.input1(SignImm),.selector(alusrc),.out(SrcB));
MUX #(.width(32)) Memory_Out_Mux(.input0(ALUResult),.input1(ReadData),.selector(memtoreg),.out(Result));

Program_Counter pc(.PC(PC_Next_State),.clk(clk),.reset_n(reset),.PC_output(PC_Current_State));

Instruction_Memory instruction_memory(.instruction_address(PC_Current_State[9:2]),.instruction(instruction));

Register_File RegFile(.A1(instruction[25:21]),.A2(instruction[20:16]),.A3(WriteReg),.WD3(Result),.clk(clk),.WE3(regwrite),
 	      .RD1(RD1),.RD2(RD2));

Control_Unit control(.Opcode(instruction[31:26]),.Funct(instruction[5:0]),.ALUControl(ALUControl),.jump(jump),.memwrite(memwrite),
	     .regwrite(regwrite),.regdest(regdest),.alusrc(alusrc),.memtoreg(memtoreg),.branch(branch));

Sign_Extension Sign_Extend(.in(instruction[15:0]),.out(SignImm));

ALU alu(.SrcA(SrcA),.SrcB(SrcB),.ALUControl(ALUControl),.ALUResult(ALUResult),.zero_flag(Zero));

Data_Memory RAM(.Address(ALUResult),.WD(RD2),.clk(clk),.WE(memwrite),.RD(ReadData),.test_value(test_value));

Adder pc_add4(.input1(PC_Current_State),.input2('d4),.out(PCplus4));

Shifter #(.width_in(32),.width_out(32)) Shifter_branch(.in(SignImm),.out(Shifted_SignImm));

Adder pc_adder_branch(.input1(Shifted_SignImm),.input2(PCplus4),.out(PCbranch));

Shifter #(.width_in(26),.width_out(28)) Shifter_Jump(.in(instruction[25:0]),.out(jump_address));

assign PCSrc =Zero & branch;
assign SrcA=RD1;
assign PCJump={PCplus4[31:28],jump_address};

endmodule
