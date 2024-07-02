`timescale 1ns/1ps
module MIPS_tb();
reg clk;
reg reset;
wire [15:0]test_value;

MIPS mips(.clk(clk),.reset(reset),.test_value(test_value));

localparam T=10;
always 
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

initial
begin
reset=1'b0;
#2
reset=1'b1;
#20;
end

endmodule
