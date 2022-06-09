module top_conv_8x8(clk,in,filter,out);
input clk;
input [127:0]in;
input [17:0]filter;
output [71:0]out;

/*
mac_new mac1(clk,{in[25:20],in[15:10],in[5:0]},filter,out[1:0]);
mac_new mac2(clk,{in[27:22],in[17:12],in[7:2]},filter,out[3:2]);
mac_new mac3(clk,{in[29:24],in[19:14],in[9:4]},filter,out[5:4]);

mac_new mac4(clk,{in[35:30],in[25:20],in[15:10]},filter,out[7:6]);
mac_new mac5(clk,{in[37:32],in[27:22],in[17:12]},filter,out[9:8]);
mac_new mac6(clk,{in[39:34],in[29:24],in[19:14]},filter,out[11:10]);

mac_new mac7(clk,{in[45:40],in[35:30],in[25:20]},filter,out[13:12]);
mac_new mac8(clk,{in[47:42],in[37:32],in[27:22]},filter,out[15:14]);
mac_new mac9(clk,{in[49:44],in[39:34],in[29:24]},filter,out[17:16]);
*/

    genvar k;
    genvar l;
    generate
      for (k = 0; k < 6; k = k + 1) begin : gen_loop
        for (l = 0; l < 6; l = l + 1) begin : gen_loop
          mac_new_8x8 mac_new_8x80(clk, {in[2*8*(k+2)+l*2 +: 6], in[2*8*(k+1)+l*2 +: 6], in[2*8*k+l*2 +: 6]}, filter, out[2*6*k+l*2 +: 2]);
        end
      end
    endgenerate


endmodule
