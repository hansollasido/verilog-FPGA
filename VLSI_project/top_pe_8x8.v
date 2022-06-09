module top_pe_8x8(clk,in,filter,out);
input clk;
input [127:0]in;
input [17:0]filter;
output [71:0]out;

wire [35:0]out1;
wire [35:0]out2;
wire [35:0]out3;
wire [35:0]out4;
wire [35:0]out5;
wire [35:0]out6;

pe_new_8x8 pe1(clk,in[15:0],filter[5:0],out1[11:0]);
pe_new_8x8 pe2(clk,in[31:16],filter[11:6],out1[23:12]);
pe_new_8x8 pe3(clk,in[47:32],filter[17:12],out1[35:24]);

assign out[11:0] = out1[35:24] + out1[23:12] + out1[11:0];

pe_new_8x8 pe4(clk,in[31:16],filter[5:0],out2[11:0]);
pe_new_8x8 pe5(clk,in[47:32],filter[11:6],out2[23:12]);
pe_new_8x8 pe6(clk,in[63:48],filter[17:12],out2[35:24]);

assign out[23:12] = out2[35:24] + out2[23:12] + out2[11:0];


pe_new_8x8 pe7(clk,in[47:32],filter[5:0],out3[11:0]);
pe_new_8x8 pe8(clk,in[63:48],filter[11:6],out3[23:12]);
pe_new_8x8 pe9(clk,in[79:64],filter[17:12],out3[35:24]);

assign out[35:24] = out3[35:24] + out3[23:12] + out3[11:0];


pe_new_8x8 pe10(clk,in[63:48],filter[5:0],out4[11:0]);
pe_new_8x8 pe11(clk,in[79:64],filter[11:6],out4[23:12]);
pe_new_8x8 pe12(clk,in[95:80],filter[17:12],out4[35:24]);

assign out[47:36] = out4[35:24] + out4[23:12] + out4[11:0];

pe_new_8x8 pe13(clk,in[79:64],filter[5:0],out5[11:0]);
pe_new_8x8 pe14(clk,in[95:80],filter[11:6],out5[23:12]);
pe_new_8x8 pe15(clk,in[111:96],filter[17:12],out5[35:24]);

assign out[59:48] = out5[35:24] + out5[23:12] + out5[11:0];


pe_new_8x8 pe16(clk,in[95:80],filter[5:0],out6[11:0]);
pe_new_8x8 pe17(clk,in[111:96],filter[11:6],out6[23:12]);
pe_new_8x8 pe18(clk,in[127:112],filter[17:12],out6[35:24]);

assign out[71:60] = out6[35:24] + out6[23:12] + out6[11:0];


endmodule