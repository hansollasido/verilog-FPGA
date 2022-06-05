module conv_new(in1,clk,out);
input [99:0]in1;
input clk;
output [80:0]out;


wire [3:0] filter [0:2] [0:2];
reg [8:0]out1 [0:2] [0:2];
integer i,j;
reg [3:0]in [0:4][0:4];

assign filter[0][0] = -1;
assign filter[0][1] = 0;
assign filter[0][2] = 1;
assign filter[1][0] = -1;
assign filter[1][1] = 0;
assign filter[1][2] = 1;
assign filter[2][0] = -1;
assign filter[2][1] = 0;
assign filter[2][2] = 1;

always@(posedge clk)begin
	in[0][0] = in1[3:0];
	in[0][1] = in1[7:4];
	in[0][2] = in1[11:8];
	in[0][3] = in1[15:12];
	in[0][4] = in1[19:16];

	in[1][0] = in1[23:20];
	in[1][1] = in1[27:24];
	in[1][2] = in1[31:28];
	in[1][3] = in1[35:32];
	in[1][4] = in1[39:36];

	in[2][0] = in1[43:40];
	in[2][1] = in1[47:44];
	in[2][2] = in1[51:48];
	in[2][3] = in1[55:52];
	in[2][4] = in1[59:56];
	
	in[3][0] = in1[63:60];
	in[3][1] = in1[67:64];
	in[3][2] = in1[71:68];
	in[3][3] = in1[75:72];
	in[3][4] = in1[79:76];

	in[4][0] = in1[83:80];
	in[4][1] = in1[87:84];
	in[4][2] = in1[91:88];
	in[4][3] = in1[95:92];
	in[4][4] = in1[99:96];

	out1[0][0] = 0;
	out1[0][1] = 0;
	out1[0][2] = 0;
	out1[1][0] = 0;
	out1[1][1] = 0;
	out1[1][2] = 0;
	out1[2][0] = 0;
	out1[2][1] = 0;
	out1[2][2] = 0;
	for (i=0;i<3;i=i+1)begin
		for (j=0;j<3;j=j+1)begin
			out1[0][0] = (in[i][j] * filter[i][j]) + out1[0][0];
			out1[0][1] = (in[i][j+1] * filter[i][j]) + out1[0][1];
			out1[0][2] = (in[i][j+2] * filter[i][j]) + out1[0][2];
			out1[1][0] = (in[i+1][j] * filter[i][j]) + out1[1][0];
			out1[1][1] = (in[i+1][j+1] * filter[i][j]) + out1[1][1];
			out1[1][2] = (in[i+1][j+2] * filter[i][j]) + out1[1][2];
			out1[2][0] = (in[i+2][j] * filter[i][j]) + out1[2][0];
			out1[2][1] = (in[i+2][j+1] * filter[i][j]) + out1[2][1];
			out1[2][2] = (in[i+2][j+2] * filter[i][j]) + out1[2][2];
		end
	end

end
	
assign out[8:0] = out1[0][0];
assign out[17:9] = out1[0][1];
assign out[26:18] = out1[0][2];
assign out[35:27] = out1[1][0];
assign out[44:36] = out1[1][1];
assign out[53:45] = out1[1][2];
assign out[62:54] = out1[2][0];
assign out[71:63] = out1[2][1];
assign out[80:72] = out1[2][2];

endmodule


