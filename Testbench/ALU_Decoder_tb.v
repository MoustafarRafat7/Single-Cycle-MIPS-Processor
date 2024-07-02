`timescale 1ns/1ps
module ALU_Decoder_tb
(
);

wire [2:0]ALUControl;
reg [5:0]Funct;
reg [1:0]ALUOp;

ALU_Decoder Decoder(.ALUOp(ALUOp),.Funct(Funct),.ALUControl(ALUControl));
initial 
begin
  // Test Case 1
        ALUOp = 2'b00; Funct = 6'b101010;
        #10
     
        // Test Case 2
        ALUOp = 2'b01; Funct = 6'b111111;
        #10
       
        // Test Case 3
        ALUOp = 2'b10; Funct = 6'b100000;
        #10
       
        // Test Case 4
        ALUOp = 2'b10; Funct = 6'b100010;
        #10
   
        // Test Case 5
        ALUOp = 2'b10; Funct = 6'b101010;
        #10
       
        // Test Case 6
        ALUOp = 2'b10; Funct = 6'b011100;
        #10

        // Test Case 7
        ALUOp = 2'b10; Funct = 6'b111101;
        #10
	// Test Case 8
        ALUOp = 2'b11; Funct = 6'b110101;
        #10
	// Test Case 9
        ALUOp = 2'b01; Funct = 6'b111101;
        #10;

      
    end


endmodule
