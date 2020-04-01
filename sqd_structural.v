module sqd_structural(
input CLK, 
input X,
input RESET,
output Z_OUT
);

wire Q0,Q0N,Q1,Q1N,Q2,Q2N;	//State Bits
wire A1,A2,A3,A4,A5;			//Gate output wires
wire D0,D1,D2;					//D Flip-Flop inputs
wire XN;							//Inverse of input bit X

//State Registers
d_flipflop ff0(D0,RESET,CLK,Q0,Q0N);
d_flipflop ff1(D1,RESET,CLK,Q1,Q1N);
d_flipflop ff2(D2,RESET,CLK,Q2,Q2N);

//Next State Logic
not I1 (XN, X);

//D2 In
and G1 (D2, Q1,Q0,X);	

//D1 In
and G2 (A1, Q0,XN);
and G3 (A2, Q2,XN);
and G4 (A3, Q1,Q0N,X);
or  G5 (D1, A1,A2,A3);	

//D0 In
and G6 (A4, Q2N,Q1N,X);
and G7 (A5, Q2N,Q0N,X);
or  G8 (D0, A4,A5);		

//Output Logic
and G9 (Z_OUT, Q2,Q1N,Q0N,X);

always @(posedge CLK)
begin
$monitor("Q:%b%b%b, X:%b, Z:%b", Q2,Q1,Q0, X,Z_OUT);
end

endmodule
