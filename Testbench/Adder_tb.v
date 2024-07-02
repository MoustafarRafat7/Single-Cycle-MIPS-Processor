`timescale 1ns/1ps
module Adder_tb
(
);
wire [31:0]out;
reg [31:0]input1,input2;

Adder adder(.input1(input1),.input2(input2),.out(out));
initial
begin
// Test case 1
        input1 =1000000 ; 
 	input2 =2000000 ;
        #10
        
        // Test case 2
        input1 =2000000 ; 
 	input2 =10000000 ;
        #10
        

        // Test case 3: 
        input1 =25000000 ; 
 	input2 =2200000 ;
        #10;
     
        
end
endmodule