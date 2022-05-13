`timescale 1ns/100ps

module full_adder(
	input a,b,cin,
	output s,cout);
	
	assign s = (a^b)^cin;
	assign cout = ((a&b) | ((a^b)&cin));
endmodule

module RCA_4bit(
	input a0,b0,a1,b1,a2,b2,a3,b3,cin,
	output s0,s1,s2,s3,cout);
	wire cout1;
	
	full_adder full_adder0(a0,b0,cin,s0,cout1);
	full_adder full_adder1(a1,b1,cout1,s1,cout1);
	full_adder full_adder2(a2,b2,cout1,s2,cout1);
	full_adder full_adder3(a3,b3,cout1,s3,cout);
endmodule

module tb_4bit_RCA();
	reg a0,b0,a1,b1,a2,b2,a3,b3,cin;
	wire s0,s1,s2,s3,cout;

	RCA_4bit RCA_4bit0(a0,a0,b0,a1,b1,a2,b2,a3,b3,cin,s0,s1,s2,s3,cout);
	initial begin
		a0=1;b0=1;a1=1;b1=0;a2=0;b2=0;a3=0;b3=0;cin=0;
	end
endmodule

