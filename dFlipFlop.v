
module posEdge_dff(d,clk,q,qbar);
	input d, clk;
	wire s1,s2,s3,s4;
	output q,qbar;
	
	always @(posedge clk);
	
	nand n1(s1,s4,s2);
	nand n2(s2,s1,clk);
	nand n3(s3,s2,s4,clk);
	nand n4(s4,s3,d);

	nand n5(q,s2,qbar);
	nand n6(qbar,q,s3);

endmodule

module testBench;	
	
	reg d,clk,s1,s2,s3,s4;
	wire q,qbar;
	
	posEdge_dff pdff(d,clk,q,qbar);
	initial	begin
		clk = 0;
		d = 0;
		
		$dumpfile("GDFF.vcd");
		$dumpvars(1,pdff);
		#1 d = 1;
		#1 d = 0;
		#1 d = 1;
		#2 d = 0;
		#1 d = 1;
		#1 d = 0;
		#3 d = 1;
		#1 d = 0;
		#2 d = 1;
		#1 d = 0;
		#2 d = 1;
		#6 d = 0;
		$finish;
	end
		always #1 clk = ~clk;
		//$finish;
	
endmodule