module Main_Decoder_tb
(
);
reg [5:0]Opcode;
wire jump,memwrite,regwrite,regdest,alusrc,memtoreg,branch;
wire[1:0]ALUOp;

Main_Decoder Decoder(.Opcode(Opcode),.ALUOp(ALUOp),.jump(jump),.memwrite(memwrite),.regwrite(regwrite),.regdest(regdest),.alusrc(alusrc),
                     .memtoreg(memtoreg),.branch(branch));
initial 
begin
 	// Test Case 1
        Opcode=6'b100011;
        #10

        // Test Case 2
        Opcode=6'b10_1011;
        #10
       
        // Test Case 3
        Opcode=6'b000000;
        #10
       
        // Test Case 4
        Opcode=6'b001000;
        #10
   
        // Test Case 5
        Opcode=6'b000100;
        #10
       
        // Test Case 6
        Opcode=6'b000010;
        #10

        // Test Case 7
        Opcode=6'b110011;
        #10
	// Test Case 8
        Opcode=6'b111111;
        #10
	// Test Case 9
        Opcode=6'b100001;
        #10;
    end


endmodule
