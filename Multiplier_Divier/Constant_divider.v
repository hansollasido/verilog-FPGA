`timescale 1ns/1ns

//20bit DD7

module DD7_20bit(in,clk,out);
	input [19:0] in;
	input clk;
	output reg [19:0] out;

	reg [19:0] r_data[0:5];

	always@(posedge clk) begin
		r_data[0] <= in;
		r_data[1] <= r_data[0];
		r_data[2] <= r_data[1];
		r_data[3] <= r_data[2];
		r_data[4] <= r_data[3];
		r_data[5] <= r_data[4];
		out <= r_data[5];
	end
endmodule



module Divider( 
input [19:0]a,
input clk,
output [19:0]out
);

wire [19:0]a1;
wire [19:0]a2;
wire [19:0]a3;
wire [19:0]a4;

wire [1:0]c;
wire [19:0]s1;

DD7_20bit fff1(a,clk,a1);

assign a2 = a>>3;
assign a3 = a>>6;
assign a4 = a1>>9;

Pip20CLA ff1(a2,a3,1'b0,clk,s1,c[0]);
Pip20CLA ff2(s1,a4,1'b0,clk,out,c[1]);

endmodule

module tb_Constant_divider();
reg [19:0]a;
reg clk;
wire [19:0] out;

always #5 clk=~clk;

Divider ff0(a,clk,out);

initial begin
	a=20'b0000000111_0000000000; clk=1'b0;
	#30
	a=20'b0000000101_0000110000; 
	#20
	a=20'b0000011111_0110000000; 
	#30
	a=20'b1100011111_0011000000;
	#30
	a=20'b1001100111_0000000000; 
end
endmodule