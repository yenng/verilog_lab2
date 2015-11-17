module register_tb();

	reg load, clock, reset;
	reg [2:0] IR;
	reg [4:0] IR1,D2;
	reg [7:0] D1;
	wire [4:0] Out2;
	wire [7:0] Out1;
	
	initial begin
	clock	= 0;
	reset	= 0;
	load 	= 1;
	D1		= 8'b11111111;
	D2		= 8'b11111;
	
	#2	load = 0;	
	#2 reset = 1;
	#1	load = 1;
	#1 reset = 0;
	#4	load = 0;
	#8	load = 1;
	
	end
	always #1 clock = ~clock;
	always #2 D1 = D1 - 1;
	always #2 D2 = D2 - 1;
	
	register #(.data_size(8)) eightBitsRegisterTest(load, clock, reset, D1, Out1);
	register #(.data_size(5)) fiveBitsRegisterTest(load, clock, reset, D2, Out2);
	
	always@(Out1, Out2, load) begin
		//if(load) begin
		$display("Reset = %d ", reset);
		$display("Load = %d, IR_D = %d, IR = %d ", load, D1, Out1);
		$display("Load = %d, PC_D = %d, PC = %d ", load, D2, Out2);
		//	if(Out1 == D1 && Out2 == D2)
		//		$display("Correct! >~<");
		//	else
		//		$display("Wrong! >n<");
		//end
	
	end
endmodule 