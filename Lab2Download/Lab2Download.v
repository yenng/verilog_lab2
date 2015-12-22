module Lab2Download(
	input CLOCK_50,
	input [9:0] SW,
	input [1:0] KEY,
	output [9:0] LEDR,
	output [7:0] LEDG
	);
	
	wire clock;
	
	slowClock clockOut(CLOCK_50, clock);
	Lab2 showReselt(SW[8],clock,SW[9], KEY[1], SW[7:0],LEDR[9],LEDR[7:0],LEDG[7:4],LEDG[2:0]);

//	Lab2 processer(Enter, Clock, Reset,In	,Input,		Halt,	Output,	displayState,	IR);

endmodule 