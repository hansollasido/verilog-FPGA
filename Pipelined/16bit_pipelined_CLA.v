module DD1(in,clk,out);
	input in, clk;
	output reg out;

	always@(posedge clk) begin
		out<=in;
	end
endmodule


//PGU
module PGU(a,b,p,g);
	input [15:0] a,b;
	output [15:0] p,g;

	assign p=a^b;
	assign g=a&b;

endmodule

//BCLU
module BCLU(p,g,cin,ps,gs,c);
	input [3:0] p,g;
	input cin;
	output ps,gs;
	output [2:0] c;

	assign ps=p[3]&p[2]&p[1]&p[0];
	assign gs=g[3]|p[3]&g[2]|p[3]&p[2]&g[1]|p[3]&p[2]&p[1]&g[0];

	assign c[0]=g[0]|p[0]&cin;
	assign c[1]=g[1]|p[1]&g[0]|p[1]&p[0]&cin;
	assign c[2]=g[2]|p[2]&g[1]|p[2]&p[1]&g[0]|p[2]&p[1]&p[0]&cin;
endmodule

//CLU
module CLU(ps,gs,cin,c);
	input ps,gs,cin;
	output c;


	assign c=gs|ps&cin;
endmodule

//SU
module SU(p,cin,c,s);
	input [15:0] p;
	input cin;
	input [14:0] c;
	output [15:0] s;

	assign s=p^{c,cin};
endmodule



//3bit D1
module D1_3bit(in,clk,out);
	input [2:0] in;
	input clk;
	output reg [2:0] out;

	always@(posedge clk) begin
		out<=in;
	end
endmodule

//4bit D1
module D1_4bit(in,clk,out);
	input [3:0] in;
	input clk;
	output reg [3:0]out;


	always@(posedge clk) begin
		out<=in;
	end
endmodule

//16bit D1
module D1_16bit(in,clk,out);
  	input [15:0] in;
  	input clk;
  	output reg [15:0] out;
  
  	always@(posedge clk) begin
    		out<=in;
  
	end

endmodule


//1bit DD2

module DD2(in,clk,out);

  	input in, clk;

  	output reg out;

  	reg r_data;

  

  	always@(posedge clk) begin
    		r_data <= in;
    		out <= r_data;
   	end
endmodule
 
//1bit DD3

module DD3(in,clk,out);

  	input in, clk;

  	output reg out;

  	reg [1:0] r_data;

  

  	always@(posedge clk) begin
    		r_data[0] <= in;
    		r_data[1] <= r_data[0];
    		out <= r_data[1];
   	end
endmodule
 
//1bit DD4

module DD4(in,clk,out);

  	input in, clk;

  	output reg out;

  	reg [2:0] r_data;

  

  	always@(posedge clk) begin
    		r_data[0] <= in;
    		r_data[1] <= r_data[0];
    		r_data[2] <= r_data[1];
    		out <= r_data[2];
   	end
endmodule


//4bit DD2
module DD2_4bit(in,clk,out);
	input [3:0] in;
	input clk;
	output reg [3:0] out;
	
	reg [3:0] r_data;

	always@(posedge clk) begin
		r_data <= in;
		out <= r_data;
	end
endmodule

//4bit DD3

module DD3_4bit(in,clk,out);
	input [3:0] in;
	input clk;
	output reg [3:0] out;
	
	reg [3:0] r_data[0:1];

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		out <= r_data[1];
	end
endmodule

//3bit DD2

module DD2_3bit(in,clk,out);
	input [2:0] in;
	input clk;
	output reg [2:0] out;

	reg [2:0] r_data;

	always@(posedge clk) begin
		r_data <= in;
		out <= r_data;
	end
endmodule

//3bit DD3

module DD3_3bit(in,clk,out);
	input [2:0] in;
	input clk;
	output reg [2:0] out;
	
	reg [2:0] r_data[0:1];

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		out <= r_data[1];
	end
endmodule

//3bit DD4

module DD4_3bit(in,clk,out);
	input [2:0] in;
	input clk;
	output reg [2:0] out;

	reg [2:0] r_data[0:2];

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		r_data[2] <= r_data[1];
		out <= r_data[2];
	end
endmodule

//16it DD4

module DD4_16bit(in,clk,out);
	input [15:0] in;
	input clk;
	output reg [15:0] out;
	
	reg [15:0] r_data[0:2];

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		r_data[2] <= r_data[1];
		out <= r_data[2];
	end
endmodule

module Pip16CLA(a,b,cin,clk,s,cout);
	input [15:0] a,b;
	input cin;
	input clk;
	output [15:0] s;
	output cout;

	wire cin2;
	wire cin22;
	wire [15:0] a2,b2,p,g,p2,g2,p22; //pccc
	wire [11:0] p222,g222; //pcc, gcc

	wire [14:0] c;
	wire [2:0] c2;
	wire [15:0] c22;

	wire [3:0] ps,gs,ps2,gs2;

	//D1 PGU
	D1_16bit D1(a,clk,a2);
	D1_16bit D2(b,clk,b2);
	PGU PGU0(a2,b2,p,g);
	D1_16bit D3(p,clk,p2);
	D1_16bit D4(g,clk,g2);

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
	CLU CLU3(ps2[3],gs2[3],c2[2],cout);
	//SU
	DD3 D71(cin22,clk,c22[0]);

	DD4_3bit D72(c[2:0],clk,c22[3:1]);
	DD3 D73(c[3],clk,c22[4]);

	DD3_3bit D74(c[6:4],clk,c22[7:5]);
	DD2 D75(c[7],clk,c22[8]);

	DD2_3bit D76(c[10:8],clk,c22[11:9]);
	DD1 D77(c[11],clk,c22[12]);

	D1_3bit D81(c[14:12],clk,c22[15:13]);
	DD4_16bit D82(p2[15:0],clk,p22[15:0]);
	SU SU0(p22,c22[0],c22[15:1],s);
endmodule


`timescale 1ns/1ns

module tb_Pip16CLA();
	reg clk=0;
	reg [15:0]a,b;
	reg cin;
	wire [15:0] s;
	wire cout;

	Pip16CLA Pip16CLA0(a,b,cin,clk,s,cout);

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












