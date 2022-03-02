 `timescale 1ns / 1ps  

module ALU_TB;

 reg[31:0] A,B;
 reg[2:0] Select;

 
 wire cin;
 assign cin = 1'b0;

 wire[31:0] Output;
 
 wire CarryOut;
 wire isZero;
 wire isNegative;
 wire Overflow;
 
 
 // Verilog code for ALU
 integer i;
 ALU a(A,B,cin,Select,Output,isNegative,isZero, Overflow, CarryOut);
    
	 
	 
	 initial begin
    // hold reset state for 100 ns.
      A = 32'h02732189;
      B = 32'h47503783;
      Select = 3'b000;
      #100
      for (i=0;i<6;i=i+1)
      begin
       Select = Select + 1'b1;
       #100;
      end
      
    end
endmodule