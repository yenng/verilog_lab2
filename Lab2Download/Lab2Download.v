module Lab2Download(
	input [9:0] SW,
	input [1:0] KEY,
	output [9:0] LEDR,
	output [7:0] LEDG
	);
	
	Lab2 showReselt(SW[9],KEY[0],SW[0], KEY[1], SW[8:1],LEDR[9],LEDR[7:0],LEDG[7:4],LEDG[2:0]);



endmodule 