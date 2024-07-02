module ALU
(
input [31:0]SrcA,
input [31:0]SrcB,
input [2:0]ALUControl,
output reg [31:0]ALUResult,
output reg zero_flag 
);

always@(SrcA,SrcB,ALUControl)
begin
zero_flag=1'b0;
ALUResult=32'b0;
  case(ALUControl)
      3'b000: ALUResult = SrcA & SrcB;
      3'b001: ALUResult = SrcA | SrcB;
      3'b010: ALUResult = SrcA + SrcB;
      3'b100: ALUResult = SrcA - SrcB;
      3'b101: ALUResult = SrcA * SrcB;
      3'b110: ALUResult = SrcA < SrcB;
      default: ALUResult=32'b0; 
  endcase
      if(ALUResult == 0)
      zero_flag=1'b1;
      else
      zero_flag=1'b0;
end

endmodule
