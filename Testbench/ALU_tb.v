`timescale 1ns/1ps
module ALU_tb
(
);

wire zero_flag;
wire [31:0]ALUResult;
reg [31:0]SrcA;
reg [31:0]SrcB; 
reg[2:0]ALUControl;
ALU Alu(.SrcA(SrcA),.SrcB(SrcB),.ALUControl(ALUControl),
        .ALUResult(ALUResult),.zero_flag(zero_flag));
initial
begin
SrcA=0;
SrcB=199999;
ALUControl=3'b101;
#10
SrcA=0;
SrcB=199999;
ALUControl=3'b001;
#10
SrcA=0;
SrcB=199999;
ALUControl=3'b010;
#10
SrcA=0;
SrcB=199999;
ALUControl=3'b100;
#10
SrcA=0;
SrcB=199999;
ALUControl=3'b110;
#10
SrcA=0;
SrcB=199999;
ALUControl=3'b111;
#10
SrcA=1;
SrcB=199999;
ALUControl=3'b101;
#10;
end
endmodule



