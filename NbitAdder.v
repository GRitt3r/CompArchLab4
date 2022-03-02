module NbitAdder(A,B,F,carryin, carryout);
parameter N=32;
input [N-1:0] A,B;
output [N-1:0] F;
output wire  carryout;
input carryin;
wire [N-1:0] carry;
	genvar i;
	generate 
		for(i=0;i<N;i=i+1)
			begin: generateNbitAdder
			if(i==0) 
				Fulladder a (A[i],B[i],F[i],carryin,carry[i]);
			else if (i<(N-1))
				Fulladder a (A[i],B[i],F[i],carry[i-1],carry[i]);
			else 
				Fulladder a (A[i],B[i],F[i],carry[i-1],carryout);
			end
	endgenerate
endmodule 


