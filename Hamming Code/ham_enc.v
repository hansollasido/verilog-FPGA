`timescale 1ns/100ps
module ham_enc(info_bits, codeword);
input [11:0]info_bits;
output [16:0]codeword;

assign codeword[2] = info_bits[0];
assign codeword[4] = info_bits[1];
assign codeword[5] = info_bits[2];
assign codeword[6] = info_bits[3];
assign codeword[8] = info_bits[4];
assign codeword[9] = info_bits[5];
assign codeword[10] = info_bits[6];
assign codeword[11] = info_bits[7];
assign codeword[12] = info_bits[8];
assign codeword[13] = info_bits[9];
assign codeword[14] = info_bits[10];
assign codeword[16] = info_bits[11];

assign codeword[0] = info_bits[0]^info_bits[1]^info_bits[3]^info_bits[4]^info_bits[6]^info_bits[8]^info_bits[10]^info_bits[11];
assign codeword[1] = info_bits[0]^info_bits[2]^info_bits[3]^info_bits[5]^info_bits[6]^info_bits[9]^info_bits[10];
assign codeword[3] = info_bits[1]^info_bits[2]^info_bits[3]^info_bits[7]^info_bits[8]^info_bits[9]^info_bits[10];
assign codeword[7] = info_bits[4]^info_bits[5]^info_bits[6]^info_bits[7]^info_bits[8]^info_bits[9]^info_bits[10];
assign codeword[15] = info_bits[11];


endmodule
