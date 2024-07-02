module Instruction_Memory
(
input [7:0]instruction_address,
output[31:0] instruction
);

reg [31:0]ROM[0:255];
integer i;
/*initial 
begin

ROM[0]=32'h00008020;
ROM[1]=32'h20100007;
ROM[2]=32'h00008820;
ROM[3]=32'h20110001;
ROM[4]=32'h12000003;
ROM[5]=32'h0230881c;
ROM[6]=32'h2210ffff;
ROM[7]=32'h08000004;
ROM[8]=32'hac110000;
for(i=9;i<256;i=i+1)
begin
ROM[i]=32'b0;
end
end
*/
initial 
begin

ROM[0]=32'h00008020;
ROM[1]=32'h20100078;
ROM[2]=32'h00008820;
ROM[3]=32'h201100b4;
ROM[4]=32'h00009020;
ROM[5]=32'h12110006;
ROM[6]=32'h0211482a;
ROM[7]=32'h11200002;
ROM[8]=32'h02308822;
ROM[9]=32'h08000005;
ROM[10]=32'h02118022;
ROM[11]=32'h08000005;
ROM[12]=32'h00109020;
ROM[13]=32'hAC120000;
for(i=14;i<256;i=i+1)
begin
ROM[i]=32'b0;
end
end
assign instruction= ROM[instruction_address];
endmodule
