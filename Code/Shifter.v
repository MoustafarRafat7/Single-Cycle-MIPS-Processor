module Shifter
#(parameter width_in=32,width_out=32)
(
input [width_in-1:0]in,
output [width_out-1:0]out
);

assign out=in<<2;
endmodule
