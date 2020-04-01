module d_flipflop(
input D,
input RESET,
input CLK,
output reg Q,
output reg QN
);


always @(posedge CLK)
	if(RESET)
		Q = 0;
	else begin
		Q = D;
		QN = ~D;
	end

endmodule