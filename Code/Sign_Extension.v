module Sign_Extension
(
input [15:0]in,
output [31:0]out
);
generate
genvar k;
for(k=16;k<32;k=k+1) 
begin
assign out[k]= (in[15]==1'b1);
end
endgenerate
assign out[15:0]=in[15:0];
endmodule
