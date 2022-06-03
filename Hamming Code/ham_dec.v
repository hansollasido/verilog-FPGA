`timescale 1ns/100ps
module ham_dec(codeword, esti_bits);
input [16:0]codeword;
output [11:0]esti_bits;

reg [16:0]err_cw;
reg [16:0]corr_cw;
wire [5:0]position;

//error
always@(*) begin
if (codeword[8]==0)begin
err_cw = codeword;
err_cw[8] = 1;
end
else if(codeword[8]==1)begin
err_cw = codeword;
err_cw[8] = 0;
end
end

assign position[0] = err_cw[0]^err_cw[2]^err_cw[4]^err_cw[6]^err_cw[8]^err_cw[10]^err_cw[12]^err_cw[14]^err_cw[16];
assign position[1] = err_cw[1]^err_cw[2]^err_cw[5]^err_cw[6]^err_cw[9]^err_cw[10]^err_cw[13]^err_cw[14];
assign position[2] = err_cw[3]^err_cw[4]^err_cw[5]^err_cw[6]^err_cw[11]^err_cw[12]^err_cw[13]^err_cw[14];
assign position[3] = err_cw[7]^err_cw[8]^err_cw[9]^err_cw[10]^err_cw[11]^err_cw[12]^err_cw[13]^err_cw[14];
assign position[4] = err_cw[15]^err_cw[16];
assign position[5] = 0;

always@(*)begin
if (position==1)begin
corr_cw = err_cw;
corr_cw[0] = ~err_cw[0];
end
else if(position==2)begin
corr_cw = err_cw;
corr_cw[1] = ~err_cw[1];
end
else if(position==3)begin
corr_cw = err_cw;
corr_cw[2] = ~err_cw[2];
end
else if(position==4)begin
corr_cw = err_cw;
corr_cw[3] = ~err_cw[3];
end
else if(position==5)begin
corr_cw = err_cw;
corr_cw[4] = ~err_cw[4];
end
else if(position==6)begin
corr_cw = err_cw;
corr_cw[5] = ~err_cw[5];
end
else if(position==7)begin
corr_cw = err_cw;
corr_cw[6] = ~err_cw[6];
end
else if(position==8)begin
corr_cw = err_cw;
corr_cw[7] = ~err_cw[7];
end
else if(position==9)begin
corr_cw = err_cw;
corr_cw[8] = ~err_cw[8];
end
else if(position==10)begin
corr_cw = err_cw;
corr_cw[9] = ~err_cw[9];
end
else if(position==11)begin
corr_cw = err_cw;
corr_cw[10] = ~err_cw[10];
end
else if(position==12)begin
corr_cw = err_cw;
corr_cw[11] = ~err_cw[11];
end
else if(position==13)begin
corr_cw = err_cw;
corr_cw[12] = ~err_cw[12];
end
else if(position==14)begin
corr_cw = err_cw;
corr_cw[13] = ~err_cw[13];
end
else if(position==15)begin
corr_cw = err_cw;
corr_cw[14] = ~err_cw[14];
end
else if(position==16)begin
corr_cw = err_cw;
corr_cw[15] = ~err_cw[15];
end
else if(position==17)begin
corr_cw = err_cw;
corr_cw[16] = ~err_cw[16];
end
end

assign esti_bits[0] = corr_cw[2];
assign esti_bits[1] = corr_cw[4];
assign esti_bits[2] = corr_cw[5];
assign esti_bits[3] = corr_cw[6];
assign esti_bits[4] = corr_cw[8];
assign esti_bits[5] = corr_cw[9];
assign esti_bits[6] = corr_cw[10];
assign esti_bits[7] = corr_cw[11];
assign esti_bits[8] = corr_cw[12];
assign esti_bits[9] = corr_cw[13];
assign esti_bits[10] = corr_cw[14];
assign esti_bits[11] = corr_cw[16];






endmodule

