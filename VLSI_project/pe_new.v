module pe_new(clk,in,filter,out);
input clk;
input [9:0]in;
input [5:0]filter;
output [5:0]out;


reg [5:0]out1;

always@(posedge clk)begin
	out1[1:0] = in[1:0] * filter[1:0] + in[3:2] * filter[3:2] + in[5:4] * filter[5:4];
	out1[3:2] = in[3:2] * filter[1:0] + in[5:4] * filter[3:2] + in[7:6] * filter[5:4];
	out1[5:4] = in[5:4] * filter[1:0] + in[7:6] * filter[3:2] + in[9:8] * filter[5:4];
end

assign out = out1;

endmodule

