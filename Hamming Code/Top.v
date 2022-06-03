`timescale 1ns/100ps
module top(info_bits, esti_bits, ham_dis);
input [11:0]info_bits;
output [11:0]esti_bits;
output [3:0]ham_dis;

//ham_enc, ham_dec, bit_com Instantiation
wire [16:0]codeword;


ham_enc f0(info_bits,codeword);
ham_dec f1(codeword,esti_bits);
bit_com f2(info_bits,esti_bits,ham_dis);



endmodule
