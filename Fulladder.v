module Fulladder(A,B,Sum,Cin,Cout);
input A, B, Cin;
output wire Sum, Cout;

assign {Cout,Sum} = A + B + Cin;
endmodule
