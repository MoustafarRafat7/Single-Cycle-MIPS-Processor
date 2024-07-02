`timescale 1ns/1ps
module MUX_tb
();

reg [31:0]input0,input1;
reg selector;
wire [31:0]out;
MUX #(.width(32)) mux (.input1(input1),.input0(input0),.selector(selector),.out(out));
initial 
begin
input1=1111;
input0=0;
selector=1;
#10
input1=1111;
input0=0;
selector=0;
#10;

end
endmodule
