module Main_Decoder
(
input [5:0]Opcode,
output reg jump,memwrite,regwrite,regdest,alusrc,memtoreg,branch,
output reg [1:0]ALUOp
);
always@(Opcode)
begin
case(Opcode)
6'b100011:
         begin
	 ALUOp=2'b00;
         jump =1'b0;
         memwrite=1'b0;
         regwrite=1'b1;
	 regdest=1'b0;
         alusrc=1'b1;
         memtoreg=1'b1;
 	 branch=1'b0; 
	 end

6'b101011:
         begin
	 ALUOp=2'b00;
         jump =1'b0;
         memwrite=1'b1;
         regwrite=1'b0;
	 regdest=1'b0;
         alusrc=1'b1;
         memtoreg=1'b1;
 	 branch=1'b0; 
	 end

6'b000000:
         begin
	 ALUOp=2'b10;
         jump =1'b0;
         memwrite=1'b0;
         regwrite=1'b1;
	 regdest=1'b1;
         alusrc=1'b0;
         memtoreg=1'b0;
 	 branch=1'b0; 
	 end
6'b001000:
         begin
	 ALUOp=2'b00;
         jump =1'b0;
         memwrite=1'b0;
         regwrite=1'b1;
	 regdest=1'b0;
         alusrc=1'b1;
         memtoreg=1'b0;
 	 branch=1'b0; 
	 end
6'b000100:
         begin
	 ALUOp=2'b01;
         jump =1'b0;
         memwrite=1'b0;
         regwrite=1'b0;
	 regdest=1'b0;
         alusrc=1'b0;
         memtoreg=1'b0;
 	 branch=1'b1; 
	 end
	
6'b000010:
  	 begin
	 ALUOp=2'b00;
         jump =1'b1;
         memwrite=1'b0;
         regwrite=1'b0;
	 regdest=1'b0;
         alusrc=1'b0;
         memtoreg=1'b0;
 	 branch=1'b0; 
	 end
default :
         begin
 	 ALUOp=2'b00;
         jump =1'b0;
         memwrite=1'b0;
         regwrite=1'b0;
	 regdest=1'b0;
         alusrc=1'b0;
         memtoreg=1'b0;
 	 branch=1'b0; 
	 end

endcase
end
endmodule
