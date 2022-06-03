`timescale 1ns/1ns

//PGU
module PGU20(a,b,p,g);
	input [19:0] a,b;
	output [19:0] p,g;

	assign p=a^b;
	assign g=a&b;

endmodule

//4bit D1
module D1_20bit(in,clk,out);
	input [19:0] in;
	input clk;
	output reg [19:0]out;


	always@(posedge clk) begin
		out<=in;
	end
endmodule

//SU20
module SU20(p,cin,c,s);
	input [19:0] p;
	input cin;
	input [18:0] c;
	output [19:0] s;

	assign s=p^{c,cin};
endmodule


//3bit DD5

module DD5_3bit(in,clk,out);
	input [2:0] in;
	input clk;
	output reg [2:0] out;

	reg [2:0] r_data[0:3];

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		r_data[2] <= r_data[1];
		r_data[3] <= r_data[2];
		out <= r_data[3];
	end
endmodule

//20bit DD5

module DD5_20bit(in,clk,out);
	input [19:0] in;
	input clk;
	output reg [19:0] out;

	reg [19:0] r_data[0:3];

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		r_data[2] <= r_data[1];
		r_data[3] <= r_data[2];
		out <= r_data[3];
	end
endmodule


//4bit DD4

module DD4_4bit(in,clk,out);
	input [3:0] in;
	input clk;
	output reg [3:0] out;
	
	reg [3:0] r_data[0:2];

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		r_data[2] <= r_data[1];
		out <= r_data[2];
	end
endmodule

module Pip20CLA(a,b,cin,clk,s,cout);
	input [19:0] a,b;
	input cin;
	input clk;
	output [19:0] s;
	output cout;

	wire cin2;
	wire cin22;
	wire [19:0] a2,b2,p,g,p2,g2,p22; //pccc
	wire [15:0] p222,g222; //pcc, gcc

	wire [19:0] c;
	wire [3:0] c2;
	wire [19:0] c22;


	wire [4:0] ps,gs,ps2,gs2;

	//D1 PGU
	// 20bit D1 has to be made
	D1_20bit D1(a,clk,a2);
	D1_20bit D2(b,clk,b2);
	PGU20 PGU0(a2,b2,p,g);
	D1_20bit D3(p,clk,p2);
	D1_20bit D4(g,clk,g2);

	//BCLU0
	DD2 D11(cin,clk,cin2);
	BCLU BCLU0(p2[3:0],g2[3:0],cin2,ps[0],gs[0],c[2:0]);
	DD1 D12(ps[0],clk,ps2[0]);
	DD1 D13(gs[0],clk,gs2[0]);

	//CLU0
	DD3 D21(cin,clk,cin22);
	CLU CLU0(ps2[0],gs2[0],cin22,c[3]);
	
	//BCLU1
	D1_4bit D31(p2[7:4],clk,p222[3:0]);
	D1_4bit D32(g2[7:4],clk,g222[3:0]);
	BCLU BCLU1(p222[3:0],g222[3:0],c[3],ps[1],gs[1],c[6:4]);
	DD1 D33(ps[1],clk,ps2[1]);
	DD1 D34(gs[1],clk,gs2[1]);


	//CLU1
	DD1 D41(c[3],clk,c2[0]);
	CLU CLU1(ps2[1],gs2[1],c2[0],c[7]);
	
	//BCLU2
	DD2_4bit D42(p2[11:8],clk,p222[7:4]);
	DD2_4bit D43(g2[11:8],clk,g222[7:4]);
	BCLU BCLU2(p222[7:4],g222[7:4],c[7],ps[2],gs[2],c[10:8]);
	DD1 D44(ps[2],clk,ps2[2]);
	DD1 D45(gs[2],clk,gs2[2]);

	//CLU2
	DD1 D51(c[7],clk,c2[1]);
	CLU CLU2(ps2[2],gs2[2],c2[1],c[11]);
	//BCLU3
	DD3_4bit D52(p2[15:12],clk,p222[11:8]);
	DD3_4bit D53(g2[15:12],clk,g222[11:8]);
	BCLU BCLU3(p222[11:8],g222[11:8],c[11],ps[3],gs[3],c[14:12]);
	DD1 D54(ps[3],clk,ps2[3]);
	DD1 D55(gs[3],clk,gs2[3]);
	
	//CLU3
	DD1 D61(c[11],clk,c2[2]);
	CLU CLU3(ps2[3],gs2[3],c2[2],c[15]);


	//BCLU4
	//DD4_4bit has to be made
	DD4_4bit D71(p2[19:16],clk,p222[15:12]);
	DD4_4bit D72(g2[19:16],clk,g222[15:12]);
	BCLU BCLU4(p222[15:12],g222[15:12],c[15],ps[4],gs[4],c[18:16]);
	DD1 D73(ps[4],clk,ps2[4]);
	DD1 D74(gs[4],clk,gs2[4]);

	//CLU4
	DD1 D81(c[15],clk,c2[3]);
	CLU CLU4(ps2[4],gs2[4],c2[3],cout);
	

	//SU
	DD4 D100(cin22,clk,c22[0]);
	// delay4
	
	
	//DD5? ???? ?? ??
	DD5_3bit D102(c[2:0],clk,c22[3:1]);
	DD4 D103(c[3],clk,c22[4]);

	DD4_3bit D104(c[6:4],clk,c22[7:5]);
	DD3 D105(c[7],clk,c22[8]);

	DD3_3bit D106(c[10:8],clk,c22[11:9]);
	DD2 D107(c[11],clk,c22[12]);

	DD2_3bit D108(c[14:12],clk,c22[15:13]);
	DD1 D109(c[15],clk,c22[16]);

	//DD5 20bit has to be made
	D1_3bit D110(c[18:16],clk,c22[19:17]);
	DD5_20bit D111(p2[19:0],clk,p22[19:0]);
	SU20 SU0(p22,c22[0],c22[19:1],s);
endmodule


module tb_Pip20CLA();
	reg clk=0;
	reg [19:0]a,b;
	reg cin;
	wire [19:0] s;
	wire cout;

	Pip20CLA Pip20CLA0(a,b,cin,clk,s,cout);

	always #5 clk=~clk;

	initial begin
		a=20'b0000_0110_1111_0111_0111;
		b=20'b0000_0111_0001_0111_1000;
		cin=0;
	
		#150
		a=20'b0000_0011_0000_0000_0000;
		b=20'b1111_0000_0000_0000_0000;
		cin=0;
		
		#150
		a=20'b0000_0000_1111_0111_0111;
		b=20'b0001_0110_0000_0000_1000;
		cin=0;

		#150
		a=20'b0000_0000_0000_0000_0001;
		b=20'b0000_0000_0110_0000_0011;
		cin=1;
		
		#150
		a=20'b0000_0000_0000_1101_0111;
		b=20'b0000_0000_0110_0111_1000;
		cin=1;

	end
		

endmodule
