module Enabled_SR_Latch(S,R,Q,Qbar,En);
	input S,R,En;
	output Q,Qbar;
	wire x1,x2;
	
	nand n1(x1,S,En);
	nand n2(x2,En,R);
	nand n3(Q,Qbar,x1);
	nand n4(Qbar,x2,Q);
	
endmodule


module sr_latch_testbench;
	reg S,R,En ;//,Q,Qbar;
	wire Q,Qbar;
	Enabled_SR_Latch srl(S,R,Q,Qbar,En);
	
	initial begin
	
		//always #3 En = ~En;
		En = 1;
		$monitor($time , "  S = %b, R = %b, En = %d , Q = %b, Q' = %b",S,R,En,Q,Qbar);
		$dumpfile("Enabled_SR_Latch.vcd");
		$dumpvars(0,srl);
		//Q = 1; Qbar = 0;
		#1 S = 1; R = 0;
		#2 S = 0; R = 0;
		#1 S = 0; R = 1;
		#2 S = 0; R = 0;
		#3 S = 1; R = 0;
		#4 S = 0; R = 1;
		#1 S = 0; R = 0;
		#1 S = 0; R = 0;
		$finish;
	
	end
		always #1 En = ~En;

endmodule