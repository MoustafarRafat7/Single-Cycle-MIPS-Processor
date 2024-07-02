`timescale 1ns/1ps
module Shifter_tb
();

reg [31:0]in;
wire [31:0]out;

Shifter #(.width_in(32),.width_out(32)) shifter(.in(in),.out(out));

initial 
begin
in=1;
#5
in=10;
#5;
in=100;
#5
in=10000000;
#10;
end
endmodule
