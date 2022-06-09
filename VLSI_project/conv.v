module conv(clk, im, out_im);

  input clk;
  input [13311:0] im;
  //input signed [12:0] filter3x3 [0:2] [0:2];
  output [11699:0] out_im;

  wire [13311:0] im_delayed;
  reg [12:0] mul [0:2] [0:2];
  integer i, j, image, r;

  reg [116:0] a;
  wire [12:0] b;
  
    genvar k;
    genvar l;
    generate
      for (k = 0; k < 30; k = k + 1) begin : gen_loop
        for (l = 0; l < 30; l = l + 1) begin : gen_loop
          //delay_im delay_im(im,clk,im_delayed);
          mac mac(clk, im[13*32*k+l*13 +: 13*3], im[13*32*(k+1)+l*13 +: 13*3], im[13*32*(k+2)+l*13 +: 13*3], out_im[13*30*k+l*13 +: 13]);
          //defparam mac.myparam = 10; 
          //assign im_delayed = 1x;
        end
      end
    endgenerate

endmodule

module delay_im(i,clk,o);
  input [13311:0] i;
  input clk;
  output reg[13311:0] o;
  reg [13311:0] r;
  
  always@(posedge clk) begin
    r <= i;
    o <= r;
  end

endmodule



/*
   integer k;
   for (k = 0; k < 30; k = k + 1) begin
    genvar l;
    generate
     for (l = 0; l < 30; l = l + 1) begin : gen_loop
        a = im[l+2:l][l+2:l];
        mac mac(clk, a, filter3x3, b);
        out_im[l][l] = b;
     end
    endgenerate
    end

  always @(posedge clk) begin
    for (i=0; i<3; i=i+1) begin
      for (j=0; j<3; j=j+1) begin
        mul[i][j] = in[i][j] * filter[i][j];
      end
    end
  end
*/

/*
  always @(posedge clk) begin
    for (i=0; i<3; i=i+1) begin
      for (j=0; j<3; j=j+1) begin
        mac mac0(clk, in, filter, out);*/



/*
  initial begin
  image = $fopen("dog.csv","r");
  for (i=0; i<32; i=i+1) begin
    r = $fscanf(image,"%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
                      im[13*32*i+13:13*32*i+1], im[13*32*i+13*2:13*32*i+13+1], im[13*32*i+13*3:13*32*i+13*2+1], im[13*32*i+13*4:13*32*i+13*3+1], im[13*32*i+13*5:13*32*i+13*4+1], im[13*32*i+13*6:13*32*i+13*5+1], im[13*32*i+13*7:13*32*i+13*6+1], im[13*32*i+13*8:13*32*i+13*7+1], im[13*32*i+13*9:13*32*i+13*8+1], im[13*32*i+13*10:13*32*i+13*9+1], im[13*32*i+13*11:13*32*i+13*10+1], im[13*32*i+13*12:13*32*i+13*11+1], im[13*32*i+13*13:13*32*i+13*12+1], im[13*32*i+13*14:13*32*i+13*13+1], im[13*32*i+13*15:13*32*i+13*14+1], im[13*32*i+13*16:13*32*i+13*15+1], im[13*32*i+13*17:13*32*i+13*16+1], im[13*32*i+13*18:13*32*i+13*17+1], im[13*32*i+13*19:13*32*i+13*18+1], im[13*32*i+13*20:13*32*i+13*19+1], im[13*32*i+13*21:13*32*i+13*20+1], im[13*32*i+13*22:13*32*i+13*21+1], im[13*32*i+13*23:13*32*i+13*22+1], im[13*32*i+13*24:13*32*i+13*23+1], im[13*32*i+13*25:13*32*i+13*24+1], im[13*32*i+13*26:13*32*i+13*25+1], im[13*32*i+13*27:13*32*i+13*26+1], im[13*32*i+13*28:13*32*i+13*27+1], im[13*32*i+13*29:13*32*i+13*28+1], im[13*32*i+13*30:13*32*i+13*29+1], im[13*32*i+13*31:13*32*i+13*30+1], im[13*32*i+13*32:13*32*i+13*31+1]);
  end
  
  for (i=0; i<32; i=i+1) begin
    $display("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
             im[13*32*i+13:13*32*i+1], im[13*32*i+13*2:13*32*i+13+1], im[13*32*i+13*3:13*32*i+13*2+1], im[13*32*i+13*4:13*32*i+13*3+1], im[13*32*i+13*5:13*32*i+13*4+1], im[13*32*i+13*6:13*32*i+13*5+1], im[13*32*i+13*7:13*32*i+13*6+1], im[13*32*i+13*8:13*32*i+13*7+1], im[13*32*i+13*9:13*32*i+13*8+1], im[13*32*i+13*10:13*32*i+13*9+1], im[13*32*i+13*11:13*32*i+13*10+1], im[13*32*i+13*12:13*32*i+13*11+1], im[13*32*i+13*13:13*32*i+13*12+1], im[13*32*i+13*14:13*32*i+13*13+1], im[13*32*i+13*15:13*32*i+13*14+1], im[13*32*i+13*16:13*32*i+13*15+1], im[13*32*i+13*17:13*32*i+13*16+1], im[13*32*i+13*18:13*32*i+13*17+1], im[13*32*i+13*19:13*32*i+13*18+1], im[13*32*i+13*20:13*32*i+13*19+1], im[13*32*i+13*21:13*32*i+13*20+1], im[13*32*i+13*22:13*32*i+13*21+1], im[13*32*i+13*23:13*32*i+13*22+1], im[13*32*i+13*24:13*32*i+13*23+1], im[13*32*i+13*25:13*32*i+13*24+1], im[13*32*i+13*26:13*32*i+13*25+1], im[13*32*i+13*27:13*32*i+13*26+1], im[13*32*i+13*28:13*32*i+13*27+1], im[13*32*i+13*29:13*32*i+13*28+1], im[13*32*i+13*30:13*32*i+13*29+1], im[13*32*i+13*31:13*32*i+13*30+1], im[13*32*i+13*32:13*32*i+13*31+1]);
  end
  
  #10 $fclose(image);

  /*filt=$fopen("3X3filter.csv","r");
  for (i=0; i<3; i=i+1) begin
    r = $fscanf(filt,"%d, %d, %d", filter3x3[i][0], filter3x3[i][1], filter3x3[i][2]);
  end
  end
  */
/*
   int fd;
   string c, str, ant;
   int num;
   initial begin
      if ((fd=$fopen("in.csv", "r")) != 0)
	while($fgets(str,fd) != 0) begin
	  if (str.match("ANT")) begin
	     // else: !if((fd=$fopen("in.csv", "r")) != 0)$sscanf(str, "%s %d", ant, num);
	     $display("%s :VALUE: %d", ant, num);
	  end
      end 
   end */

