`timescale 1ns/100ps
module bit_com(info_bits, esti_bits, ham_dis);
input [11:0]info_bits, esti_bits;
output [3:0]ham_dis;

reg [3:0]count;

always@(*)begin
count = 0;
if(info_bits[0]!=esti_bits[0])begin
count = count + 1;
end
if(info_bits[1]!=esti_bits[1])begin
count = count + 1;
end
if(info_bits[2]!=esti_bits[2])begin
count = count + 1;
end
if(info_bits[3]!=esti_bits[3])begin
count = count + 1;
end
if(info_bits[4]!=esti_bits[4])begin
count = count + 1;
end
if(info_bits[5]!=esti_bits[5])begin
count = count + 1;
end
if(info_bits[6]!=esti_bits[6])begin
count = count + 1;
end
if(info_bits[7]!=esti_bits[7])begin
count = count + 1;
end
if(info_bits[8]!=esti_bits[8])begin
count = count + 1;
end
if(info_bits[9]!=esti_bits[9])begin
count = count + 1;
end
if(info_bits[10]!=esti_bits[10])begin 
count = count + 1;
end
if(info_bits[11]!=esti_bits[11])begin
count = count + 1;
end

end

assign ham_dis = count;


endmodule
