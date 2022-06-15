module top_nn_f0(clk,in,filter1,filter2,filter3,filter4,out1,out2);
input clk;
input [287:0]in;
input [17:0]filter1;
input [17:0]filter2;
input [17:0]filter3;
input [17:0]filter4;
output [255:0]out1,out2;

wire [199:0]o2,o3;

//top_pe_12x12 f0(clk,in,filter1,o1);
top_pe_12x12 f1(clk,in,filter3,o2);
top_pe_12x12 f2(clk,in,filter2,o3);

//top_pe_10x10 f3(clk,o1,filter1,out1[127:0]);
//top_pe_10x10 f4(clk,o1,filter2,out2[127:0]);

top_pe_10x10 f5(clk,o2,filter3,out1[127:0]);
top_pe_10x10 f6(clk,o2,filter4,out2[127:0]);

top_pe_10x10 f7(clk,o3,filter2,out1[255:128]);
top_pe_10x10 f8(clk,o3,filter2,out2[255:128]);

endmodule



