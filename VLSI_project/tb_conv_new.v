`timescale 1ns/100ps
module tb_conv_new();

reg [99:0]in;
reg clk = 0;
wire [80:0]out;
integer i;


always #5 clk=~clk;
conv_new conv_new0(in,clk,out);

initial begin
	in[3:0]=4'd5;in[7:4]=4'd3;in[11:8]=4'd2;in[15:12]=4'd1;in[19:16]=4'd4;
	in[23:20]=4'd0;in[27:24]=4'd0;in[31:28]=1;in[35:32]=4'd2;in[39:36]=4'd3;
	in[43:40]=4'd0;in[47:44]=4'd1;in[51:48]=4'd1;in[55:52]=4'd2;in[59:56]=4'd3;
	in[63:60]=4'd4;in[67:64]=4'd1;in[71:68]=4'd0;in[75:72]=4'd1;in[79:76]=4'd2;
	in[83:80]=4'd3;in[87:84]=4'd1;in[91:88]=4'd0;in[95:92]=4'd4;in[99:96]=4'd1;
	
	//$display("%d, %d, %d \n %d, %d, %d, \n %d, %d, %d",out[8:0],out[17:9],out[26:18],out[35:27],out[44:36],out[53:45],out[62:54],out[71:63],out[80:72]);
	
	
	
end
endmodule