`timescale 1ns/100ps

module full_adder(
	input a,b,cin,
	output s,cout);
	
	assign s = (a^b)^cin;
	assign cout = ((a&b) | ((a^b)&cin));
endmodule






module tb_full_adder();
	reg a,b,cin;
	wire s,cout;

	full_adder full_adder0(a,b,cin,s,cout);

	initial begin
		a=0;b=0;cin=0;
		#10
		a=0;b=0;cin=1;
		#10
		a=0;b=1;cin=0;
		#10
		a=0;b=1;cin=1;
		#10
		a=1;b=0;cin=0;
		#10
		a=1;b=0;cin=1;
		#10
		a=1;b=1;cin=0;
		#10
		a=1;b=1;cin=1;
	end
endmodule

