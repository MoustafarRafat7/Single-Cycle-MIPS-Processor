module Register_File
(
input [4:0]A1,A2,A3,
input [31:0]WD3,
input clk,
input WE3,
output [31:0]RD1,RD2
);

reg [31:0]RAM[0:31];

integer i;
initial 
begin 
for(i=0;i<32;i=i+1)
begin
RAM[i]=32'b0;
end
end
// Write Operation //
always@(posedge clk)
begin
if(WE3)
RAM[A3]<=WD3;
else
RAM[A3]<=RAM[A3];
end
// Read Operation //
assign RD1=RAM[A1];
assign RD2=RAM[A2];

endmodule