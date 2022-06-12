module pe_new_10x10(clk,in,filter,out);
input clk;
input [19:0]in;
input [5:0]filter;
output [15:0]out;


//always@(posedge clk)begin
assign out[1:0] = in[1:0] * filter[1:0] + in[3:2] * filter[3:2] + in[5:4] * filter[5:4];
assign out[3:2] = in[3:2] * filter[1:0] + in[5:4] * filter[3:2] + in[7:6] * filter[5:4];
assign out[5:4] = in[5:4] * filter[1:0] + in[7:6] * filter[3:2] + in[9:8] * filter[5:4];
assign out[7:6] = in[7:6] * filter[1:0] + in[9:8] * filter[3:2] + in[11:10] * filter[5:4];
assign out[9:8] = in[9:8] * filter[1:0] + in[11:10] * filter[3:2] + in[13:12] * filter[5:4];
assign out[11:10] = in[11:10] * filter[1:0] + in[13:12] * filter[3:2] + in[15:14] * filter[5:4];
assign out[13:12] = in[13:12] * filter[1:0] + in[15:14] * filter[3:2] + in[17:16] * filter[5:4];
assign out[15:14] = in[15:14] * filter[1:0] + in[17:16] * filter[3:2] + in[19:18] * filter[5:4];
//end


endmodule
