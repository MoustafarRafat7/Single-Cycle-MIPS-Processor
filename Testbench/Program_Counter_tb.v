`timescale 1ns/1ps
module Program_Counter_tb
(
);
reg[31:0] PC;
reg clk,reset_n;
wire [31:0]PC_output;
localparam T=20;
Program_Counter Pc (.PC(PC),.clk(clk),.reset_n(reset_n),.PC_output(PC_output));

always
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

initial 
begin
reset_n=1'b1;
PC=111101111;
#(T+5)
reset_n=1'b0;
#5
reset_n=1'b1;
PC=35533222;
#25;

PC=20242025;
#15;
end

endmodule
