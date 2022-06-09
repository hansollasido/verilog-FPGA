module pe_new_8x8(clk,in,filter,out);
input clk;
input [15:0]in;
input [5:0]filter;
output [11:0]out;

reg [11:0]out1;

always@(posedge clk)begin
	out1[1:0] = in[1:0] * filter[1:0] + in[3:2] * filter[3:2] + in[5:4] * filter[5:4];
	out1[3:2] = in[3:2] * filter[1:0] + in[5:4] * filter[3:2] + in[7:6] * filter[5:4];
	out1[5:4] = in[5:4] * filter[1:0] + in[7:6] * filter[3:2] + in[9:8] * filter[5:4];
	out1[7:6] = in[7:6] * filter[1:0] + in[9:8] * filter[3:2] + in[11:10] * filter[5:4];
	out1[9:8] = in[9:8] * filter[1:0] + in[11:10] * filter[3:2] + in[13:12] * filter[5:4];
	out1[11:10] = in[11:10] * filter[1:0] + in[13:12] * filter[3:2] + in[15:14] * filter[5:4];
end

assign out = out1;

endmodule

