// Top Level 
module GateLevel4BitAdder(a,b,cin,s,cout);
	input [3:0] a, b;
	input cin; 
	output [3:0] s; 
	output cout;
	wire cout1, cout2, cout3;

	FullAdder fa0(a[0],b[0],cin,s[0],cout1);
	FullAdder fa1(a[1],b[1],cout1,s[1],cout2);
	FullAdder fa2(a[2],b[2],cout2,s[2],cout3);
	FullAdder fa3(a[3],b[3],cout3,s[3],cout);
endmodule

// Down Level
//one bit full adder
module FullAdder(a,b,cin,s,cout);
	input a,b,cin; 
	output s,cout;
	wire s1,c1,s2;
	
	xor x1(s1,a,b);
	xor x2(s,s1,cin);
	xor x3(cout,s2,c1);
	and a1(c1,a,b);
	and a2(s2,s1,cin);
	
endmodule

module adder_Test_Bench;
	reg [3:0] a, b;
	wire [3:0] s;
	wire cout;
	integer i,j;
	// instantiate the design block
	GateLevel4BitAdder gla(a,b,1'b0,s,cout);
	initial
	begin
		
		$monitor("a = %b, b = %b, s = %b, c = %b\n",a,b,s,cout);
		a = 4'b0000; b = 4'b0001;
		#1 a = 4'b0000; b = 4'b0010;
		#1 a = 4'b0000; b = 4'b0100; 
		#1 a = 4'b0000; b = 4'b1000; 
		#1 a = 4'b0010; b = 4'b1010; 
		#1 a = 4'b1100; b = 4'b1010; 
		#1 a = 4'b1010; b = 4'b1110; 
		#1 a = 4'b1110; b = 4'b0110;
		#1 a = 4'b1111; b = 4'b1111;
		#1 ;//delay 1 by time unit

	end
endmodule