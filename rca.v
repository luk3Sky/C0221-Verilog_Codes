// Define the top-level module called RippleCarryAdder4.
//It instantiates 4 FullAdders.
module RippleCarryAdder4(a,b,cin,s,cout);
	input [3:0] a, b; input cin; // I/O signals will be explained later
	output [3:0] s; output cout;
	wire cout1, cout2, cout3; //wires for connecting instances
	//Four instances of the module FullAdder are created.
	//Each has a unique name.
	//Each instance is passed a set of signals.
	//Notice, that each instance is a copy of
	// the module FullAdder.
	FullAdder fa0(a[0],b[0],cin,s[0],cout1);
	FullAdder fa1(a[1],b[1],cout1,s[1],cout2);
	FullAdder fa2(a[2],b[2],cout2,s[2],cout3);
	FullAdder fa3(a[3],b[3],cout3,s[3],cout);
endmodule

module FullAdder(a,b,cin,s,cout);
	input a,b,cin; output s,cout;
	assign {cout,s} = a + b + cin;
endmodule

module stimulus;
	reg [3:0] a, b;
	wire [3:0] s;
	wire cout;
	// instantiate the design block
	RippleCarryAdder4 rca(a,b,1'b0,s,cout);
	initial
	begin
		a <= 4'b1111; //assign value for a
		b <= 4'b1010; //assign value for b
		#1 //wait for 1 simulation time unit
		$display("%d + %d = %d, %d", a,b,s,cout); //print the result
	end
endmodule