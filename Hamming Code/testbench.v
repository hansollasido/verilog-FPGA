`timescale 1ns/100ps
module tb_top();
reg [11:0]info_bits;
wire [11:0]esti_bits;
wire [3:0]ham_dis;

//top module instantiation
top top0(info_bits, esti_bits, ham_dis);

initial begin
	info_bits = 12'b0000_1010_1111;
	#20
	info_bits = 12'b1000_1011_0000;
	#20
	info_bits = 12'b0001_0000_0001;
	#20
	info_bits = 12'b0011_1100_0101;
	#20
	info_bits = 12'b1000_0011_0111;

end
endmodule

module tb_ham_enc();
reg [11:0]info_bits;
wire [16:0]codeword;

ham_enc ham_enc0(info_bits,codeword);
initial begin
	info_bits = 12'b0000_1010_1111;
	#20
	info_bits = 12'b1000_1011_0000;
	#20
	info_bits = 12'b0001_0000_0001;
	#20
	info_bits = 12'b0011_1100_0101;
	#20
	info_bits = 12'b1000_0011_0111;

end

endmodule

module tb_ham_dec();
reg [16:0]codeword;
wire [11:0]esti_bits;

ham_dec ham_dec0(codeword,esti_bits);

initial begin
	codeword = 17'b0_0000_1010_0111_0101;
	#20
	codeword = 17'b1_1000_1011_1000_1010;
	#20
	codeword = 17'b0_0001_0000_1000_1110;
	#20
	codeword = 17'b0_0011_1100_0010_0101;
	#20
	codeword = 17'b1_1000_0011_0011_0110;

end


endmodule

module tb_bit_com();
reg [11:0]info_bits, esti_bits;
wire [3:0]ham_dis;

bit_com bit_com0(info_bits,esti_bits,ham_dis);

initial begin
	info_bits = 12'b0000_1010_1111; esti_bits = 12'b0110_1010_1111;
	#20
	info_bits = 12'b1000_1011_0000; esti_bits = 12'b1000_1011_0000;
	#20
	info_bits = 12'b0001_0000_0001; esti_bits = 12'b0011_0000_0001;
	#20
	info_bits = 12'b0011_1100_0101; esti_bits = 12'b0011_1100_0101;
	#20
	info_bits = 12'b1000_0011_0111; esti_bits = 12'b1111_0011_0111;

end

endmodule
