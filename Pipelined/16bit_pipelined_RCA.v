module fulladder(a,b,cin,s,cout);
	input a,b,cin;
	output s,cout;

	assign s = (a^b)^cin;
	assign cout = ((a&b) | ((a^b)&cin));
endmodule

module DD1(in,clk,out);
	input in, clk;
	output reg out;

	always@(posedge clk) begin
		out<=in;
	end
endmodule

module DD2(in,clk,out);
	input in,clk;
	output reg out;

	reg r_data;

	always@(posedge clk) begin
		r_data <= in;
		out <= r_data;
	end
endmodule

module DD3(in,clk,out);
	input in, clk;
	output reg out;
	reg [1:0]r_data;

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		out <= r_data[1];
	end
endmodule

module DD4(in,clk,out);
	input in, clk;
	output reg out;
	reg [2:0]r_data;

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		r_data[2] <= r_data[1];
		out <= r_data[2];
	end
endmodule

module Pip4RCA(a,b,cin,clk,s,cout);
	input [3:0]a,b;
	input cin;
	input clk;
	output [3:0] s;
	output cout;

	wire [2:0] c;
	wire [2:0] c2;
	wire [3:0] b2;
	wire [3:0] a2;
	wire [3:0] out;
	wire cin2;

//FA0? ??? ? ?? s0, c0
DD1 D1(a[0], clk, a2[0]);
DD1 D2(b[0], clk, b2[0]);
DD1 D3(cin, clk, cin2);
fulladder AD0(a2[0], b2[0], cin2, out[0], c[0]);
DD3 D3_1(out[0], clk, s[0]);

//FA1? ??? ? ?? s1, c1
DD1 D11(c[0], clk, c2[0]);
DD2 D21(a[1], clk, a2[1]);
DD2 D22(b[1], clk, b2[1]);
fulladder AD1(a2[1], b2[1], c2[0], out[1], c[1]);
DD2 D2_1(out[1], clk, s[1]);

//FA2? ??? ? ?? s2, c2
DD1 D12(c[1], clk, c2[1]);
DD3 D31(a[2], clk, a2[2]);
DD3 D32(b[2], clk, b2[2]);
fulladder AD2(a2[2], b2[2], c2[1], out[2], c[2]);
DD1 D1_1(out[2], clk, s[2]);

//FA3? ??? ? ?? s3, c3
DD1 D13(c[2], clk, c2[2]);
DD4 D41(a[3], clk, a2[3]);
DD4 D42(b[3], clk, b2[3]);
fulladder AD3(a2[3], b2[3], c2[2], out[3], cout);
assign s[3] = out[3];
endmodule


module DD1_16(in,clk,out);
	input [15:0] in;
	input clk;
	output reg [15:0] out;
  
	always@(posedge clk) begin
		out<=in;
end

endmodule


module DD5(in,clk,out);

	input [3:0]in;
	input clk;
	output reg [3:0] out;
	reg [3:0] r_data[0:3];

  

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		r_data[2] <= r_data[1];
		r_data[3] <= r_data[2];
		out <= r_data[3];
	end
endmodule

module DD10(in,clk,out);
	input [3:0] in;
	input clk;
	output reg [3:0] out;
	reg [3:0] r_data[0:8];

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		r_data[2] <= r_data[1];
		r_data[3] <= r_data[2];
		r_data[4] <= r_data[3];
		r_data[5] <= r_data[4];
		r_data[6] <= r_data[5];
		r_data[7] <= r_data[6];
		r_data[8] <= r_data[7];
		out <= r_data[8];
	end
endmodule

module DD15(in,clk,out);
	input [3:0] in;
	input clk;
	output reg [3:0] out;

	reg [3:0] r_data[0:13];

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		r_data[2] <= r_data[1];
		r_data[3] <= r_data[2];
		r_data[4] <= r_data[3];
		r_data[5] <= r_data[4];
		r_data[6] <= r_data[5];
		r_data[7] <= r_data[6];
		r_data[8] <= r_data[7];
		r_data[9] <= r_data[8];
		r_data[10] <= r_data[9];
		r_data[11] <= r_data[10];
		r_data[12] <= r_data[11];
		r_data[13] <= r_data[12];
		out <= r_data[13];
	end
endmodule

module Pip16RCA(a,b,cin,clk,s,cout);
	input [15:0]a,b;
	input cin;
	input clk;
	output [15:0] s;
	output cout;

	wire cin2;
	wire [15:0] a2, b2;
	wire [11:0] a22, b22;
	wire [15:0] s2;
	wire [2:0] c;
	wire [2:0] c2;

//RCA0
DD1 D111(cin,clk,cin2);
DD1_16 D112(a,clk,a2);
DD1_16 D113(b,clk,b2);
Pip4RCA RCA0(a2[3:0],b2[3:0],cin2,clk,s2[3:0],c[0]);
DD15 D114(s2[3:0],clk,s[3:0]);

//RCA1
DD1 D121(c[0],clk,c2[0]);
DD5 D122(a2[7:4],clk,a22[3:0]);
DD5 D123(b2[7:4],clk,b22[3:0]);
Pip4RCA RCA1(a22[3:0],b22[3:0],c2[0],clk,s2[7:4],c[1]);
DD10 D124(s2[7:4],clk,s[7:4]);

//RCA2
DD1 D131(c[1],clk,c2[1]);
DD10 D132(a2[11:8],clk,a22[7:4]);
DD10 D133(b2[11:8],clk,b22[7:4]);
Pip4RCA RCA2(a22[7:4],b22[7:4],c2[1],clk,s2[11:8],c[2]);
DD5 D134(s2[11:8],clk,s[11:8]);

//RCA3
DD1 D141(c[2],clk,c2[2]);
DD15 D142(a2[15:12],clk,a22[11:8]);
DD15 D143(b2[15:12],clk,b22[11:8]);
Pip4RCA RCA3(a22[11:8],b22[11:8],c2[2],clk,s2[15:12],cout);
assign s[15:12]=s2[15:12];


endmodule



`timescale 1ns/1ns

module tb_Pip16RCA();
	reg clk=0;
	reg [15:0]a,b;
	reg cin;
	wire [15:0] s;
	wire cout;

	Pip16RCA Pip16RCA0(a,b,cin,clk,s,cout);

	always #5 clk=~clk;

	initial begin
		a=16'b0110_1111_0111_0111;
		b=16'b0111_0001_0111_1000;
		cin=0;
	
		#150
		a=16'b0011_0000_0000_0000;
		b=16'b1111_0000_0000_0000;
		cin=0;
		
		#150
		a=16'b0000_1111_0111_0111;
		b=16'b0001_0110_0000_1000;
		cin=0;

		#150
		a=16'b0000_0000_0000_0001;
		b=16'b0000_0000_0000_0011;
		cin=1;
		
		#150
		a=16'b0000_0000_1101_0111;
		b=16'b0000_0000_0111_1000;
		cin=1;

	end
		

endmodule
