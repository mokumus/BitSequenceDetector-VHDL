module sqd_structural_tb;

reg CLK;
reg X;
reg RESET;
wire Z_OUT;

integer seed, i;

sqd_structural sqd(CLK, X,RESET,Z_OUT);

initial begin
CLK = 0;
forever #5 CLK = ~CLK;
end

initial begin
	RESET = 1;
	#30;	
	RESET = 0;
end 

always @(posedge CLK)
begin

	i = $urandom%20;
	if(i > 2)
		X = 1;
	else
		X = 0;
		
	//$monitor("time = %4.1t, X = %b, Z_OUT = %b", $time, X, Z_OUT);
end	

	


endmodule
