module testBench;
	reg D,RST,CLK;
	wire Q,Qbar;
	
	dff flipflop(D,CLK,RST,Q);
	
	initial begin
		CLK = 1;
		D = 0;
		RST = 1;
		$monitor("CLK = %b D = %b Q = %b Q_BAR = %b",CLK, D, Q); 
		
		#1 D = 1;
		#3 RST = 0;
		#8 D = 0;
		#6 D = 1;
		#2 D = 0;
		#6 D = 1;
		#5 D = 0;
		#3 RST = 1;
		#10 $finish;
		
	end



	module GL_DFF()


endmodule

module dff(d, clk, reset, q);

	input d,clk,reset,set;
	output reg q,qbar;
	
	nand n1(set,d,clk);
	nand n2(reset,set,clk);
	nand n3(q,qbar,set);
	nand n4(qbar,q,clk);
	
//	always #2 CLK = ~CLK;

endmodule

