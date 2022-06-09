module mac_new(clk,in,filter,out);

input clk;
input [17:0]in;
input [17:0]filter;
output [1:0]out;
integer i;

reg [1:0]out1;

always@(posedge clk)begin
out1 = 0;
for(i=0;i<9;i=i+1)begin
	out1 = in[2*i +: 2]*filter[2*i +: 2] + out1;
end
end

assign out = out1;


endmodule
