module Lab2_tb();
	reg	Enter, Clock, Reset, In;
	reg [7:0]	Input;
	wire	Halt;
	wire	[7:0]	Output;											
	wire	[3:0] displayState;
	wire 	[2:0]	IR;
	
	
	
	
	Lab2 processer(Enter, Clock, Reset,In,Input,Halt,Output,displayState,IR);
	
endmodule 