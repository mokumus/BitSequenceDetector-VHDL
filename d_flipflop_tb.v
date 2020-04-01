module d_flipflop_tb();

reg D,RESET,CLK;
wire Z_OUT, Q, QN;

d_flipflop a1(D,RESET,CLK,Q,QN);

initial begin

$monitor("D=%b, RESET=%b, CLK=%b, Q=%b, QN=%b",D,RESET,CLK,Q,QN);

CLK = 0;

D=0; RESET=0;

#2 D=1; RESET=0;
#2 D=1; RESET=1;
#2 D=0; RESET=0;

end
always #2 CLK=~CLK;
endmodule