`timescale 1ns/100ps
module tb_pe_conv_12x12();

reg clk = 0;
reg [287:0]in;
reg [17:0]filter;
wire [199:0]out;


always #5 clk=~clk;
top_pe_12x12 top_pe_12x120(clk,in,filter,out);

initial begin
	in[1:0]=1;in[3:2]=1;in[5:4]=0;in[7:6]=1;in[9:8]=1;in[11:10]=0;in[13:12]=0;in[15:14]=1;in[17:16]=0;in[19:18]=0;in[21:20]=1;in[23:22]=1;
	in[25:24]=1;in[27:26]=1;in[29:28]=1;in[31:30]=0;in[33:32]=1;in[35:34]=0;in[37:36]=0;in[39:38]=0;in[41:40]=1;in[43:42]=1;in[45:44]=0;in[47:46]=1;
	in[49:48]=0;in[51:50]=0;in[53:52]=0;in[55:54]=1;in[57:56]=0;in[59:58]=1;in[61:60]=0;in[63:62]=1;in[65:64]=1;in[67:66]=1;in[69:68]=0;in[71:70]=1;
	in[73:72]=0;in[75:74]=0;in[77:76]=1;in[79:78]=0;in[81:80]=0;in[83:82]=1;in[85:84]=1;in[87:86]=0;in[89:88]=1;in[91:90]=1;in[93:92]=0;in[95:94]=1;
	in[97:96]=1;in[99:98]=1;in[101:100]=1;in[103:102]=0;in[105:104]=1;in[107:106]=1;in[109:108]=0;in[111:110]=1;in[113:112]=1;in[115:114]=1;in[117:116]=0;in[119:118]=1;
	in[121:120]=0;in[123:122]=1;in[125:124]=1;in[127:126]=0;in[129:128]=1;in[131:130]=0;in[133:132]=1;in[135:134]=0;in[137:136]=0;in[139:138]=1;in[141:140]=0;in[143:142]=0;
	in[145:144]=0;in[147:146]=1;in[149:148]=0;in[151:150]=1;in[153:152]=0;in[155:154]=1;in[157:156]=0;in[159:158]=1;in[161:160]=1;in[163:162]=1;in[165:164]=0;in[167:166]=1;
	in[169:168]=1;in[171:170]=1;in[173:172]=0;in[175:174]=1;in[177:176]=0;in[179:178]=1;in[181:180]=1;in[183:182]=0;in[185:184]=1;in[187:186]=0;in[189:188]=1;in[191:190]=1;
	in[193:192]=1;in[195:194]=1;in[197:196]=1;in[199:198]=0;in[201:200]=1;in[203:202]=1;in[205:204]=0;in[207:206]=1;in[209:208]=0;in[211:210]=1;in[213:212]=1;in[215:214]=0;
	in[217:216]=0;in[219:218]=0;in[221:220]=1;in[223:222]=1;in[225:224]=0;in[227:226]=0;in[229:228]=1;in[231:230]=0;in[233:232]=1;in[235:234]=0;in[237:236]=1;in[239:238]=1;
	in[241:240]=1;in[243:242]=1;in[245:244]=0;in[247:246]=0;in[249:248]=1;in[251:250]=1;in[253:252]=1;in[255:254]=0;in[257:256]=0;in[259:258]=1;in[261:260]=1;in[263:262]=0;
	in[265:264]=0;in[267:266]=0;in[269:268]=0;in[271:270]=1;in[273:272]=0;in[275:274]=1;in[277:276]=1;in[279:278]=1;in[281:280]=1;in[283:282]=0;in[285:284]=0;in[287:286]=1;
	

	filter[1:0]=0;filter[3:2]=0;filter[5:4]=0;
	filter[7:6]=0;filter[9:8]=1;filter[11:10]=0;
	filter[13:12]=0;filter[15:14]=0;filter[17:16]=0;
	
	
	//$display("%d, %d, %d \n %d, %d, %d, \n %d, %d, %d",out[8:0],out[17:9],out[26:18],out[35:27],out[44:36],out[53:45],out[62:54],out[71:63],out[80:72]);
	
	
	
end
endmodule