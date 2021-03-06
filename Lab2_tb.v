module Lab2_tb();
	reg	Enter, Clock, Reset, In;
	reg [7:0]	Input;
	wire	Halt;
	wire	[7:0]	Output;											
	wire	[3:0] 	displayState;
	wire 	[2:0]	IR;
	
	integer error,i;
	reg  [7:0] X, Y;
	
	initial begin
		Enter = 0;
		error = 0;
	#2	checking();
	#2 if(error == 0)
			$display("Simulation successful with no error!! >_<");
		else
			$display("Simulation failed with %d errors!! >n<''", error);
	end
	
	/*
	initial
	begin
	  $display("Enter | In | Input | Halt| Output| State| IR");
	  $monitor("%b     |  %b   |    %d  |  %b  |   %d   | %b | %b ", Enter, In, Input, Halt, Output, displayState, IR);
	end*/
	
	//global initial clock and initial reset
	initial begin
	  Reset <= 1; 
	  In <= 0;
	  @(posedge Clock);
	  @(negedge Clock);
	  Reset <= 0;  In <= 1;
	end

	initial begin
	  Clock = 0;
	  forever #1 Clock = ~Clock;
	end
	
	task inputData;
	input [7:0] dataIn;
	begin
	  Input = dataIn; 
	  Enter = 1;
	  #2 Enter = 0;
	end
	endtask
	
	task checkX;
	begin
	while(X != Y)
	  begin
		if(X > Y)
			X = X - Y;
		else
			Y = Y - X;
	  end
	  checkingOutput(X);
	end
	endtask
	
	task checkingOutput;
	input [7:0] expectedValue;
	begin
	  while(!Halt) #1;
		if(expectedValue != Output)
		begin
		  error = error + 1;
		  $display("FAILED!!!! Expected output = %d, Actual output = %d, No. of Error = %d", expectedValue, Output, error);
		end
		else
		  $display("SIMULATION SUCCESSFULL %d times. Output = %d.", (i + 1), Output);

	end
	endtask
	
	task checking;
	begin
		for(i = 0; i < 100; i = i + 1)
		begin
			Reset = 1;
		#2	Reset = 0;
			X = ({$random} % 128); 
			Y = ({$random} % 128);
		while(X == 0) begin 
			X = ({$random} % 128); 
		end
		while(Y == 0) begin 
			Y = ({$random} % 128); 
		end
		$display("X = %d, Y = %d ", X, Y);
		#8  inputData(X);
		#16 inputData(Y); 
			checkX();
		
	  end
	end
	endtask
	
	
	
	Lab2 processer(Enter, Clock, Reset,In,Input,Halt,Output,displayState,IR);
	
endmodule 