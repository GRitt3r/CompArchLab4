//Arithmetic addition - 000
//Logic bitwise And - 001
//Logic bitwise Or - 010
//Logic bitwise Xor - 011
//Logic bitwise Nor - 100
//Register right logic shift - 101
//Register left logic shift - 110


module ALU(A,B,cin,Select,Output,isNegative,isZero, Overflow, CarryOut);
	input [31:0] A,B;
	input [2:0] Select;
	input cin;
	output reg [31:0] Output;
	output wire CarryOut;
	output wire isNegative;
	output wire isZero;
	output wire Overflow;
	
	
	wire [31:0]sum;
	
	
	assign isZero = (Output==32'b0)? 1'b1: 1'b0;  //Z
	assign isNegative = Output[31]; //N
	assign Overflow = (~A[31]&~B[31]&Output[31])|(A[31]&B[31]&~Output[31]); //V
	
	
	
	NbitAdder aaa (A,B,sum,cin,CarryOut); //C
	 
	
	
	always @(Select)
	begin
        case(Select)
        3'b000: // Addition
		  Output = sum;
        3'b001: //  Logical and 
        Output = A & B;
        3'b010: //  Logical or
        Output = A | B;
        3'b011: //  Logical xor 
        Output = A ^ B;
        3'b100: //  Logical nor
        Output = ~(A | B);
		  3'b101: // Logical shift left
        Output = A << B[4:0];
        3'b110: // Logical shift right
        Output = A >> B[4:0];
        default: Output = sum;
        endcase
    end

endmodule