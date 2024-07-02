module MUX
#(parameter width=32)
(
input [width-1:0]input0,
input [width-1:0]input1,
input selector,
output reg [width-1:0]out
);

always@(input0,input1,selector)
begin

case(selector)
1'b0:out=input0;
1'b1:out=input1;
default:out='b0;
endcase

end
endmodule