/*
*	4x1 Multiplexer with a stimulus/testbench
*
*	Author: CO221 Digital Design 2018
*	Date: 10/05/2018
*/

// Define the stimulus module (no ports). This is a non-synthesizable module, only to be used for simulation purposes
module stimulus;

	// Declare variables to be connected to inputs
	reg IN0, IN1, IN2, IN3; // To provide input signals to the MUX
	reg S1, S0; // To provide select signals for the MUX
	
	// Declare output wire
	wire OUTPUT; // To grab the output signal from the MUX
	
	// Instantiate our MUX
	mux4_to_1 mymux(OUTPUT, IN0, IN1, IN2, IN3, S1, S0);
	
	// Stimulate the inputs
	// Define the stimulus module (no ports)
	initial // Executed only once at the begining
	begin
		// set input signal values
		IN0 = 1; IN1 = 0; IN2 = 1; IN3 = 0;
		#1 $display("IN0= %b, IN1= %b, IN2= %b, IN3= %b\n",IN0,IN1,IN2,IN3);
		// select IN0
		S1 = 0; S0 = 0;
		#1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
		// select IN1
		S1 = 0; S0 = 1;
		#1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
		// select IN2
		S1 = 1; S0 = 0;
		#1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
		// select IN3
		S1 = 1; S0 = 1;
		#1 $display("S1 = %b, S0 = %b, OUTPUT = %b \n", S1, S0, OUTPUT);
	end
	
endmodule


// Module 4-to-1 multiplexer. This is a synthesizable module
module mux4_to_1 (out, i0, i1, i2, i3, s1, s0);
	
	// Port declarations
	output out; // Output of the MUX
	input i0, i1, i2, i3; // Inputs to the MUX
	input s1, s0; // Select signals
	
	// Internal wire declarations
	wire s1n, s0n;
	wire y0, y1, y2, y3;
	
	// Gate instantiations
	// Create s1n and s0n signals.
	not (s1n, s1);
	not (s0n, s0);
	
	// 3-input and gates instantiated
	and (y0, i0, s1n, s0n);
	and (y1, i1, s1n, s0);
	and (y2, i2, s1, s0n);
	and (y3, i3, s1, s0);
	
	// 4-input or gate instantiated
	or (out, y0, y1, y2, y3);
	
endmodule