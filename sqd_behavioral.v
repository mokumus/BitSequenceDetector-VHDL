module sqd_behavioral(
input CLK, 
input X,
input RESET,
output Z_OUT
);

reg [2:0] Q = 3'b000;

always @(posedge CLK, posedge RESET)
begin
	$monitor("Q:%b, X:%b, Z:%b", Q,X,Z_OUT);
	if(RESET == 1)
		Q = 3'b000;
	
	else begin
		Q[2] <= (Q[1] & Q[0] & X);
		Q[1] <= (Q[0] & ~X) | (Q[2]& ~X) | (Q[1] & ~Q[0] & X);
		Q[0] <= (~Q[2] & ~Q[1] & X) | (~Q[2] & ~Q[0] & X);
	end
end

assign Z_OUT = Q[2] & ~Q[1] & ~Q[0] & X;
endmodule