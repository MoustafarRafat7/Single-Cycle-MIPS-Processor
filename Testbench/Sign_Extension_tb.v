module Sign_Extension_tb
(
);
reg [15:0] in;
wire [31:0] out;

   
Sign_Extension DUT (.in(in),.out(out));
initial 
	begin
        // Test case 1
        in = 16'b0000_0000_0000_0001; 
        #10
        
        // Test case 2
        in = 16'b0111_1111_1111_1111; 
        #10
        

        // Test case 3: 
        in = 16'b1000_0000_0000_0000; 
        #10
        

        // Test case 4: 
        in = 16'b1111_1111_1111_1111; 
        #10
        
        // Test case 5:
        in = 16'b1000_0000_0000_0001; 
        #10;
        
    end
endmodule

