module top_pe_12x12(clk,in,filter,out);
input clk;
input [287:0]in;
input [17:0]filter;
output [199:0]out;

wire [59:0]out1;
wire [59:0]out2;
wire [59:0]out3;
wire [59:0]out4;
wire [59:0]out5;
wire [59:0]out6;
wire [59:0]out7;
wire [59:0]out8;
wire [59:0]out9;
wire [59:0]out10;


pe_new_12x12 pe1(clk,in[23:0],filter[5:0],out1[19:0]);
pe_new_12x12 pe2(clk,in[47:24],filter[11:6],out1[39:20]);
pe_new_12x12 pe3(clk,in[71:48],filter[17:12],out1[59:40]);

assign out[19:0] = out1[59:40] + out1[39:20] + out1[19:0];

pe_new_12x12 pe4(clk,in[47:24],filter[5:0],out2[19:0]);
pe_new_12x12 pe5(clk,in[71:48],filter[11:6],out2[39:20]);
pe_new_12x12 pe6(clk,in[95:72],filter[17:12],out2[59:40]);

assign out[39:20] = out2[59:40] + out2[39:20] + out2[19:0];


pe_new_12x12 pe7(clk,in[71:48],filter[5:0],out3[19:0]);
pe_new_12x12 pe8(clk,in[95:72],filter[11:6],out3[39:20]);
pe_new_12x12 pe9(clk,in[119:96],filter[17:12],out3[59:40]);

assign out[59:40] = out3[59:40] + out3[39:20] + out3[19:0];


pe_new_12x12 pe10(clk,in[95:72],filter[5:0],out4[19:0]);
pe_new_12x12 pe11(clk,in[119:96],filter[11:6],out4[39:20]);
pe_new_12x12 pe12(clk,in[143:120],filter[17:12],out4[59:40]);

assign out[79:60] = out4[59:40] + out4[39:20] + out4[19:0];

pe_new_12x12 pe13(clk,in[119:96],filter[5:0],out5[19:0]);
pe_new_12x12 pe14(clk,in[143:120],filter[11:6],out5[39:20]);
pe_new_12x12 pe15(clk,in[167:144],filter[17:12],out5[59:40]);

assign out[99:80] = out5[59:40] + out5[39:20] + out5[19:0];


pe_new_12x12 pe16(clk,in[143:120],filter[5:0],out6[19:0]);
pe_new_12x12 pe17(clk,in[167:144],filter[11:6],out6[39:20]);
pe_new_12x12 pe18(clk,in[191:168],filter[17:12],out6[59:40]);

assign out[119:100] = out6[59:40] + out6[39:20] + out6[19:0];


pe_new_12x12 pe19(clk,in[167:144],filter[5:0],out7[19:0]);
pe_new_12x12 pe20(clk,in[191:168],filter[11:6],out7[39:20]);
pe_new_12x12 pe21(clk,in[215:192],filter[17:12],out7[59:40]);

assign out[139:120] = out7[59:40] + out7[39:20] + out7[19:0];


pe_new_12x12 pe22(clk,in[191:168],filter[5:0],out8[19:0]);
pe_new_12x12 pe23(clk,in[215:192],filter[11:6],out8[39:20]);
pe_new_12x12 pe24(clk,in[239:216],filter[17:12],out8[59:40]);

assign out[159:140] = out8[59:40] + out8[39:20] + out8[19:0];


pe_new_12x12 pe25(clk,in[215:192],filter[5:0],out9[19:0]);
pe_new_12x12 pe26(clk,in[239:216],filter[11:6],out9[39:20]);
pe_new_12x12 pe27(clk,in[263:240],filter[17:12],out9[59:40]);

assign out[179:160] = out9[59:40] + out9[39:20] + out9[19:0];


pe_new_12x12 pe28(clk,in[239:216],filter[5:0],out10[19:0]);
pe_new_12x12 pe29(clk,in[263:240],filter[11:6],out10[39:20]);
pe_new_12x12 pe30(clk,in[287:264],filter[17:12],out10[59:40]);

assign out[199:180] = out10[59:40] + out10[39:20] + out10[19:0];


endmodule
