module top_pe_10x10(clk,in,filter,out);
input clk;
input [199:0]in;
input [17:0]filter;
output [127:0]out;

wire [59:0]out1;
wire [59:0]out2;
wire [59:0]out3;
wire [59:0]out4;
wire [59:0]out5;
wire [59:0]out6;
wire [59:0]out7;
wire [59:0]out8;


pe_new_10x10 pe1(clk,in[19:0],filter[5:0],out1[15:0]);
pe_new_10x10 pe2(clk,in[39:20],filter[11:6],out1[31:16]);
pe_new_10x10 pe3(clk,in[59:40],filter[17:12],out1[47:32]);

assign out[15:0] = out1[47:32] + out1[31:16] + out1[15:0];

pe_new_10x10 pe4(clk,in[39:20],filter[5:0],out2[15:0]);
pe_new_10x10 pe5(clk,in[59:40],filter[11:6],out2[31:16]);
pe_new_10x10 pe6(clk,in[79:60],filter[17:12],out2[47:32]);

assign out[31:16] = out2[47:32] + out2[31:16] + out2[15:0];


pe_new_10x10 pe7(clk,in[59:40],filter[5:0],out3[15:0]);
pe_new_10x10 pe8(clk,in[79:60],filter[11:6],out3[31:16]);
pe_new_10x10 pe9(clk,in[99:80],filter[17:12],out3[47:32]);

assign out[47:32] = out3[47:32] + out3[31:16] + out3[15:0];


pe_new_10x10 pe10(clk,in[79:60],filter[5:0],out4[15:0]);
pe_new_10x10 pe11(clk,in[99:80],filter[11:6],out4[31:16]);
pe_new_10x10 pe12(clk,in[119:100],filter[17:12],out4[47:32]);

assign out[63:48] = out4[47:32] + out4[31:16] + out4[15:0];

pe_new_10x10 pe13(clk,in[99:80],filter[5:0],out5[15:0]);
pe_new_10x10 pe14(clk,in[119:100],filter[11:6],out5[31:16]);
pe_new_10x10 pe15(clk,in[139:120],filter[17:12],out5[47:32]);

assign out[79:64] = out5[47:32] + out5[31:16] + out5[15:0];


pe_new_10x10 pe16(clk,in[119:100],filter[5:0],out6[15:0]);
pe_new_10x10 pe17(clk,in[139:120],filter[11:6],out6[31:16]);
pe_new_10x10 pe18(clk,in[159:140],filter[17:12],out6[47:32]);

assign out[95:80] = out6[47:32] + out6[31:16] + out6[15:0];


pe_new_10x10 pe19(clk,in[139:120],filter[5:0],out7[15:0]);
pe_new_10x10 pe20(clk,in[159:140],filter[11:6],out7[31:16]);
pe_new_10x10 pe21(clk,in[179:160],filter[17:12],out7[47:32]);

assign out[111:96] = out7[47:32] + out7[31:16] + out7[15:0];


pe_new_10x10 pe22(clk,in[159:140],filter[5:0],out8[15:0]);
pe_new_10x10 pe23(clk,in[179:160],filter[11:6],out8[31:16]);
pe_new_10x10 pe24(clk,in[199:180],filter[17:12],out8[47:32]);

assign out[127:112] = out8[47:32] + out8[31:16] + out8[15:0];


endmodule
