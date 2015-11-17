module increment(
input[4:0] Input,
output reg [4:0] Output);

	always@(Input)
	Output = Input +1;
	
endmodule 