module sr_latch(s,r,q,qbar);
	input s,r;
	output q,qbar;
	
	nor n1(q,r,qbar);
	nor n2(qbar,q,s);
	
endmodule


module sr_latch_testbench;
	reg s,r ;//,q,qbar;
	wire q,qbar;
	sr_latch srl(s,r,q,qbar);
	
	initial begin
	
		//always ();
		$monitor($time , "  S = %b, R = %b, Q = %b, Q' = %b",s,r,q,qbar);
		//q = 1; qbar = 0;
		#1 s = 1; r = 0;
		#2 s = 0; r = 0;
		#1 s = 0; r = 1;
		#2 s = 0; r = 0;
		#3 s = 1; r = 0;
		#4 s = 0; r = 1;
		#1 s = 0; r = 0;
		#1 s = 0; r = 0;
		$finish;
	
	end

endmodule