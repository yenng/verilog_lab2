module Lab2(
	input	Enter, Clock, Reset, In,
	input [7:0]	Input,
	output	Halt,
	output [7:0] Output,												
	output wire [3:0] state,
	output wire [2:0]	IR
);
	
	wire	Aeq0, Apos, IRload,JMPmux, PCload, Meminst, MemWr, Aload, Sub;
	wire [1:0]	Asel;
	wire [4:0] 	Address;
	wire [7:0]	Q;
	
	controlUnit	CU(IR,Enter,Aeq0,Apos,Clock,Reset,IRload,JMPmux,PCload,Meminst,MemWr,Aload,Sub,Halt,Asel,state);
	dataPath DP(IRload,JMPmux, PCload, Meminst, MemWr, Aload, Reset, Clock, 
	Sub,In, Asel, Input, Aeq0, Apos, Address, IR, Output,Q);
	

endmodule