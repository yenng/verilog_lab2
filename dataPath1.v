module dataPath1(
	input IRload,JMPmux,PCload,Meminst,Clock,Reset,
	input [7:0] D,
	output [2:0] IR,
	output [4:0] Address);
	
	wire [7:0] IR1;
	wire [4:0] PC_in, PC,PC_increment;
	
	register #(.data_size(8)) eightBitsRegister(IRload, Clock, Reset, D, IR1);
	multiplexer #(.data_size(5)) JMP_mux(JMPmux,IR1[4:0],PC_increment,PC_in);
	register #(.data_size(5)) fiveBitsRegister(PCload, Clock, Reset, PC_in, PC);
	increment pc_increment(PC,PC_increment);
	multiplexer #(.data_size(5)) Meminst_mux(Meminst,IR1[4:0],PC,Address);
	
	assign IR = IR1[7:5];
endmodule 