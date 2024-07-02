module Data_Memory
(
input [31:0]Address,
input [31:0]WD,
input clk,
input WE,
output reg [31:0]RD,
output [15:0] test_value
);

reg [31:0]Data_RAM[0:255];
integer i;
initial begin
RD='b0;
for(i=0;i<=255;i=i+1)
Data_RAM[i]='b0;
end
// Write Operation //
always@(posedge clk)
begin
if(WE)
Data_RAM[Address]<=WD;
else
Data_RAM[Address]<=Data_RAM[Address];
end
// Read Operation //
always@(*)
if(!WE)
RD=Data_RAM[Address];
else
RD=RD;
assign test_value= Data_RAM[0][15:0];
endmodule
