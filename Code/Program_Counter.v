module Program_Counter
(
input [31:0]PC,
input clk,
input reset_n,
output [31:0]PC_output
);

reg [31:0]next_pc,current_pc;

always@(posedge clk,negedge reset_n)
begin
if (!reset_n)
current_pc<=32'b0;
else
current_pc<=next_pc;
end 

always@(PC)
begin
next_pc=PC;
end

assign PC_output =current_pc;



endmodule
