`timescale 1ns/100ps
module tb_conv3_new();

reg clk = 0;
reg [49:0]in;
reg [17:0]filter;
wire [17:0]out;


always #5 clk=~clk;
top_conv top_conv0(clk,in,filter,out);

initial begin
	in[1:0]=1;in[3:2]=1;in[5:4]=0;in[7:6]=1;in[9:8]=1;
	in[11:10]=0;in[13:12]=0;in[15:14]=1;in[17:16]=0;in[19:18]=0;
	in[21:20]=1;in[23:22]=1;in[25:24]=1;in[27:26]=1;in[29:28]=1;
	in[31:30]=0;in[33:32]=1;in[35:34]=0;in[37:36]=0;in[39:38]=0;
	in[41:40]=1;in[43:42]=1;in[45:44]=0;in[47:46]=1;in[49:48]=0;
	filter[1:0]=0;filter[3:2]=0;filter[5:4]=0;
	filter[7:6]=0;filter[9:8]=1;filter[11:10]=0;
	filter[13:12]=0;filter[15:14]=0;filter[17:16]=0;
	
	
	//$display("%d, %d, %d \n %d, %d, %d, \n %d, %d, %d",out[8:0],out[17:9],out[26:18],out[35:27],out[44:36],out[53:45],out[62:54],out[71:63],out[80:72]);
	
	
	
end
endmodule
