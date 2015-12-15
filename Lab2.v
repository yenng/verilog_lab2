module Lab2(
	input	Enter, Clock, Reset,
	input [7:0]	Input,
	output	Halt,
	output	Output

/*
	input [2:0] IR,								
	input Enter, Aeq0, Apos, clock, reset,		
	input IRload,JMPmux, PCload, Meminst, MemWr, Aload, Reset, Clock, Sub,
	input [1:0] Asel,
	input [7:0] Input,
	output Aeq0, Apos,
	output [4:0] Address,
	output wire [2:0] IR,
	output [7:0] Output, RAM_Q,
	output reg IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Halt,	
	output reg [1:0] Asel,													
	output wire [3:0] displayState,	
*/	
);
	
	wire	Aeq0, Apos, IRload,JMPmux, PCload, Meminst, MemWr, Aload, Sub;
	wire [1:0]	Asel;
	wire [2:0]	IR;
	wire [3:0]	state;
	wire [4:0] 	Address;
	wire [7:0]	Q;
	
	controlUnit	CU(IR,Enter,Aeq0,Apos,Clock,Reset,IRload,JMPmux,PCload,Meminst,MemWr,Aload,Sub,Halt,Asel,state);
	dataPath DP(IRload,JMPmux, PCload, Meminst, MemWr, Aload, Reset, Clock, 
	Sub, Asel, Input, Aeq0, Apos, Address, IR, Output,Q);
	

endmodule