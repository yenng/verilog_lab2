module controlUnit_tb();
	
	reg [2:0] IR;								//IR and Enter is the control signal.
	reg Enter, Aeq0, Apos, clock, reset;		//Aeq0 and Apos is value of part of PCload.
	wire IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Halt;	//status signal
	wire IRload1, JMPmux1, PCload1, Meminst1, MemWr1, Aload1, Sub1, Halt1;	//status signal
	wire [1:0] Asel, Asel1;												//status signal
	wire [3:0] state;
	
	wire [9:0]Yen = {IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Halt, Asel};
	wire [9:0]Cheng = {IRload1, JMPmux1, PCload1, Meminst1, MemWr1, Aload1, Sub1, Halt1, Asel1};
	
	integer i = 0;
	
	initial begin
	IR 		= 3'b000;
	Enter 	= 0;
	Aeq0 	= 0;
	Apos	= 0;
	clock	= 1;
	reset	= 1;
	#2	reset	= 0;	//state goes to fetch(state1).
	#1	reset	= 1;	//state goes to start(state0).
	#1	reset	= 0;	//state goes to fetch(state1).
	//#6 	state goes to decode(state2).
	#3	reset	= 1;	//state goes to start(state0).
	#1	reset	= 0;	//state goes to fetch(state1).
	//#10	state goes to decode(state2).
	//#12	state goes to load(state8).
	
		for (i=0;i<8;i=i+1) begin
			#8 IR = IR + 1;
		end
	end 
	initial begin
	#46	Enter = 1;
	#9	Aeq0  = 1;
	#8	Apos  = 1;
	#17 reset = 1;
	#4	reset = 0;
	end
	always #1 clock = ~clock;
	controlUnit	yen(IR,Enter,Aeq0,Apos,clock,reset,IRload,JMPmux,PCload,Meminst,MemWr,Aload,Sub,Halt,Asel,state);
	//processorCU cheng(Enter,clock,reset,Aeq0,Apos,IR,IRload1,JMPmux1,PCload1,Meminst1,MemWr1,Aload1,Sub1,Asel1,Halt1,state);
	
	always@(Yen, Cheng)begin
		if(Yen === Cheng)
		  $display("Matches! >~<");
		else begin
		  $display("Failed Matching! >n<");
		  $display("Wrong state: %d", state); 
		  if(IRload != IRload1)
		    $display("IRload for yen's design is %d, while IRload for YikCheng's design is %d", IRload, IRload1);
		  if(JMPmux != JMPmux1)
		    $display("JMPmux for yen's design is %d, while JMPmux for YikCheng's design is %d", JMPmux, JMPmux1);
		  if(PCload != PCload1)
		    $display("PCload for yen's design is %d, while PCload for YikCheng's design is %d", PCload, PCload1);
		  if(Meminst != Meminst1)
		    $display("Meminst for yen's design is %d, while Meminst for YikCheng's design is %d", Meminst, Meminst1);
		  if(MemWr != MemWr1)
		    $display("MemWr for yen's design is %d, while MemWr for YikCheng's design is %d", MemWr, MemWr1);
		  if(Aload != Aload1)
		    $display("Aload for yen's design is %d, while Aload for YikCheng's design is %d", Aload, Aload1);
		  if(Sub != Sub1)
		    $display("Sub for yen's design is %d, while Sub for YikCheng's design is %d", Sub, Sub1);
		  if(Halt != Halt1)
		    $display("Halt for yen's design is %d, while Halt for YikCheng's design is %d", Halt, Halt1);
		  if(Asel != Asel1)
		    $display("Asel for yen's design is %d, while Asel for YikCheng's design is %d", Asel, Asel1);
		  $finish;
		end  
	end
	
	
	
endmodule 