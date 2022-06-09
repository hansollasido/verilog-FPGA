module top_pe(clk,in,filter,out);
input clk;
input [49:0]in;
input [17:0]filter;
output [17:0]out;

wire [17:0]out1;
wire [17:0]out2;
wire [17:0]out3;

pe_new pe1(clk,in[9:0],filter[5:0],out1[5:0]);
pe_new pe2(clk,in[19:10],filter[11:6],out1[11:6]);
pe_new pe3(clk,in[29:20],filter[17:12],out1[17:12]);

assign out[5:0] = out1[5:0] + out1[11:6] + out1[17:12];

pe_new pe4(clk,in[19:10],filter[5:0],out2[5:0]);
pe_new pe5(clk,in[29:20],filter[11:6],out2[11:6]);
pe_new pe6(clk,in[39:30],filter[17:12],out2[17:12]);

assign out[11:6] = out2[5:0] + out2[11:6] + out2[17:12];


pe_new pe7(clk,in[29:20],filter[5:0],out3[5:0]);
pe_new pe8(clk,in[39:30],filter[11:6],out3[11:6]);
pe_new pe9(clk,in[49:40],filter[17:12],out3[17:12]);

assign out[17:12] = out3[5:0] + out3[11:6] + out3[17:12];


endmodule
