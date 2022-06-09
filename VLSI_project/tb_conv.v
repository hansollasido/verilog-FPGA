module tb_conv();

  reg clk=0;
  reg [13311:0] im=0;
  reg signed [12:0] cap [0:31];
  //reg signed [12:0] cap0 [0:29];
  reg [415:0] capcap [0:31];
  //reg [415:0] capcapo [0:29];
  //reg signed [12:0] filter3x3 [0:2] [0:2];
  wire [11699:0] out_im;
  reg signed [12:0] capo [0:899];

  always #5 clk=~clk;

  reg [12:0] mul [0:2] [0:2];
  integer i, j, image, image_out, r, w;
  `define NULL 0

  conv conv0(clk, im, out_im);

  

  initial begin

  image = $fopen("dog.csv","r");
  if (image == `NULL) begin
    $display("file handle was NULL");
    $finish;
  end

  i=0;
  while (!$feof(image)) begin
    r = $fscanf(image, "%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n",
                     cap[0], cap[1], cap[2], cap[3], cap[4], cap[5], cap[6], cap[7], cap[8], cap[9], cap[10], cap[11], cap[12], cap[13], cap[14], cap[15], cap[16], cap[17], cap[18], cap[19], cap[20], cap[21], cap[22], cap[23], cap[24], cap[25], cap[26], cap[27], cap[28], cap[29], cap[30], cap[31]);
    $display("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n",
             cap[0], cap[1], cap[2], cap[3], cap[4], cap[5], cap[6], cap[7], cap[8], cap[9], cap[10], cap[11], cap[12], cap[13], cap[14], cap[15], cap[16], cap[17], cap[18], cap[19], cap[20], cap[21], cap[22], cap[23], cap[24], cap[25], cap[26], cap[27], cap[28], cap[29], cap[30], cap[31]);
  
    capcap[i] = {cap[31], cap[30], cap[29], cap[28], cap[27], cap[26], cap[25], cap[24], cap[23], cap[22], cap[21], cap[20], cap[19], cap[18], cap[17], cap[16], cap[15], cap[14], cap[13], cap[12], cap[11], cap[10], cap[9], cap[8], cap[7], cap[6], cap[5], cap[4], cap[3], cap[2], cap[1], cap[0]};
    i=i+1;
  end
  im = {capcap[31], capcap[30], capcap[29], capcap[28], capcap[27], capcap[26], capcap[25], capcap[24], capcap[23], capcap[22], capcap[21], capcap[20], capcap[19], capcap[18], capcap[17], capcap[16], capcap[15], capcap[14], capcap[13], capcap[12], capcap[11], capcap[10], capcap[9], capcap[8], capcap[7], capcap[6], capcap[5], capcap[4], capcap[3], capcap[2], capcap[1], capcap[0]};
  

  #20
  for (i=0; i<900; i=i+1) begin
    capo[i] = out_im[13*i +: 13];
  end

  image_out = $fopen("dog_out.csv","a");

  for (i=0; i<30; i=i+1) begin
    $fwrite(image_out, "%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
                     capo[30*i+0], capo[30*i+1], capo[30*i+2], capo[30*i+3], capo[30*i+4], capo[30*i+5], capo[30*i+6], capo[30*i+7], capo[30*i+8], capo[30*i+9], capo[30*i+10], capo[30*i+11], capo[30*i+12], capo[30*i+13], capo[30*i+14], capo[30*i+15], capo[30*i+16], capo[30*i+17], capo[30*i+18], capo[30*i+19], capo[30*i+20], capo[30*i+21], capo[30*i+22], capo[30*i+23], capo[30*i+24], capo[30*i+25], capo[30*i+26], capo[30*i+27], capo[30*i+28], capo[30*i+29]);
  
  end

  #10
  $fclose(image);
  $fclose(image_out);
  end

/*
`timescale 100ps/1ps

  for (i=0; i<32; i=i+1) begin
    r = $fscanf(image,"%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
                      im[13*32*i+13:13*32*i+1], im[13*32*i+13*2:13*32*i+13+1], im[13*32*i+13*3:13*32*i+13*2+1], im[13*32*i+13*4:13*32*i+13*3+1], im[13*32*i+13*5:13*32*i+13*4+1], im[13*32*i+13*6:13*32*i+13*5+1], im[13*32*i+13*7:13*32*i+13*6+1], im[13*32*i+13*8:13*32*i+13*7+1], im[13*32*i+13*9:13*32*i+13*8+1], im[13*32*i+13*10:13*32*i+13*9+1], im[13*32*i+13*11:13*32*i+13*10+1], im[13*32*i+13*12:13*32*i+13*11+1], im[13*32*i+13*13:13*32*i+13*12+1], im[13*32*i+13*14:13*32*i+13*13+1], im[13*32*i+13*15:13*32*i+13*14+1], im[13*32*i+13*16:13*32*i+13*15+1], im[13*32*i+13*17:13*32*i+13*16+1], im[13*32*i+13*18:13*32*i+13*17+1], im[13*32*i+13*19:13*32*i+13*18+1], im[13*32*i+13*20:13*32*i+13*19+1], im[13*32*i+13*21:13*32*i+13*20+1], im[13*32*i+13*22:13*32*i+13*21+1], im[13*32*i+13*23:13*32*i+13*22+1], im[13*32*i+13*24:13*32*i+13*23+1], im[13*32*i+13*25:13*32*i+13*24+1], im[13*32*i+13*26:13*32*i+13*25+1], im[13*32*i+13*27:13*32*i+13*26+1], im[13*32*i+13*28:13*32*i+13*27+1], im[13*32*i+13*29:13*32*i+13*28+1], im[13*32*i+13*30:13*32*i+13*29+1], im[13*32*i+13*31:13*32*i+13*30+1], im[13*32*i+13*32:13*32*i+13*31+1]);
  end*/
  
/*
  for (i=0; i<32; i=i+1) begin
    $display("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
             im[13*32*i+13:13*32*i+1], im[13*32*i+13*2:13*32*i+13+1], im[13*32*i+13*3:13*32*i+13*2+1], im[13*32*i+13*4:13*32*i+13*3+1], im[13*32*i+13*5:13*32*i+13*4+1], im[13*32*i+13*6:13*32*i+13*5+1], im[13*32*i+13*7:13*32*i+13*6+1], im[13*32*i+13*8:13*32*i+13*7+1], im[13*32*i+13*9:13*32*i+13*8+1], im[13*32*i+13*10:13*32*i+13*9+1], im[13*32*i+13*11:13*32*i+13*10+1], im[13*32*i+13*12:13*32*i+13*11+1], im[13*32*i+13*13:13*32*i+13*12+1], im[13*32*i+13*14:13*32*i+13*13+1], im[13*32*i+13*15:13*32*i+13*14+1], im[13*32*i+13*16:13*32*i+13*15+1], im[13*32*i+13*17:13*32*i+13*16+1], im[13*32*i+13*18:13*32*i+13*17+1], im[13*32*i+13*19:13*32*i+13*18+1], im[13*32*i+13*20:13*32*i+13*19+1], im[13*32*i+13*21:13*32*i+13*20+1], im[13*32*i+13*22:13*32*i+13*21+1], im[13*32*i+13*23:13*32*i+13*22+1], im[13*32*i+13*24:13*32*i+13*23+1], im[13*32*i+13*25:13*32*i+13*24+1], im[13*32*i+13*26:13*32*i+13*25+1], im[13*32*i+13*27:13*32*i+13*26+1], im[13*32*i+13*28:13*32*i+13*27+1], im[13*32*i+13*29:13*32*i+13*28+1], im[13*32*i+13*30:13*32*i+13*29+1], im[13*32*i+13*31:13*32*i+13*30+1], im[13*32*i+13*32:13*32*i+13*31+1]);
  end*/
 
  //#10 $fclose(image);

  /*filt=$fopen("3X3filter.csv","r");
  for (i=0; i<3; i=i+1) begin
    r = $fscanf(filt,"%d, %d, %d", filter3x3[i][0], filter3x3[i][1], filter3x3[i][2]);
  end*/

  
//always @(* ) 
/*
while (!$feof(file)) begin
  r = $fscanf(image, "%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n",
                     cap[0], cap[1], cap[2], cap[3], cap[4], cap[5], cap[6], cap[7], cap[8], cap[9], cap[10], cap[11], cap[12], cap[13], cap[14], cap[15], cap[16], cap[17], cap[18], cap[19], cap[20], cap[21], cap[22], cap[23], cap[24], cap[25], cap[26], cap[27], cap[28], cap[29], cap[30], cap[31]);
  $display("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n",
             cap[0], cap[1], cap[2], cap[3], cap[4], cap[5], cap[6], cap[7], cap[8], cap[9], cap[10], cap[11], cap[12], cap[13], cap[14], cap[15], cap[16], cap[17], cap[18], cap[19], cap[20], cap[21], cap[22], cap[23], cap[24], cap[25], cap[26], cap[27], cap[28], cap[29], cap[30], cap[31]);
  if (!$feof(image)) begin
    for (i=0; i<32; i=i+1) begin
         capcap[i] = {cap[0], cap[1], cap[2], cap[3], cap[4], cap[5], cap[6], cap[7], cap[8], cap[9], cap[10], cap[11], cap[12], cap[13], cap[14], cap[15], cap[16], cap[17], cap[18], cap[19], cap[20], cap[21], cap[22], cap[23], cap[24], cap[25], cap[26], cap[27], cap[28], cap[29], cap[30], cap[31]};
    end
  end
end*/

//initial begin
  //im = {capcap[0], capcap[1], capcap[2], capcap[3], capcap[4], capcap[5], capcap[6], capcap[7], capcap[8], capcap[9], capcap[10], capcap[11], capcap[12], capcap[13], capcap[14], capcap[15], capcap[16], capcap[17], capcap[18], capcap[19], capcap[20], capcap[21], capcap[22], capcap[23], capcap[24], capcap[25], capcap[26], capcap[27], capcap[28], capcap[29], capcap[30], capcap[31]};
//end
/*

                    im[13*32*i+13:13*32*i+1], im[13*32*i+13*2:13*32*i+13+1], im[13*32*i+13*3:13*32*i+13*2+1], im[13*32*i+13*4:13*32*i+13*3+1], im[13*32*i+13*5:13*32*i+13*4+1], im[13*32*i+13*6:13*32*i+13*5+1], im[13*32*i+13*7:13*32*i+13*6+1], im[13*32*i+13*8:13*32*i+13*7+1], im[13*32*i+13*9:13*32*i+13*8+1], im[13*32*i+13*10:13*32*i+13*9+1], im[13*32*i+13*11:13*32*i+13*10+1], im[13*32*i+13*12:13*32*i+13*11+1], im[13*32*i+13*13:13*32*i+13*12+1], im[13*32*i+13*14:13*32*i+13*13+1], im[13*32*i+13*15:13*32*i+13*14+1], im[13*32*i+13*16:13*32*i+13*15+1], im[13*32*i+13*17:13*32*i+13*16+1], im[13*32*i+13*18:13*32*i+13*17+1], im[13*32*i+13*19:13*32*i+13*18+1], im[13*32*i+13*20:13*32*i+13*19+1], im[13*32*i+13*21:13*32*i+13*20+1], im[13*32*i+13*22:13*32*i+13*21+1], im[13*32*i+13*23:13*32*i+13*22+1], im[13*32*i+13*24:13*32*i+13*23+1], im[13*32*i+13*25:13*32*i+13*24+1], im[13*32*i+13*26:13*32*i+13*25+1], im[13*32*i+13*27:13*32*i+13*26+1], im[13*32*i+13*28:13*32*i+13*27+1], im[13*32*i+13*29:13*32*i+13*28+1], im[13*32*i+13*30:13*32*i+13*29+1], im[13*32*i+13*31:13*32*i+13*30+1], im[13*32*i+13*32:13*32*i+13*31+1]);
  im[13*32*i+13*(j+1):13*32*i+13*j+1]

initial begin
  data_file = $fopen("data_file.dat", "r");
  if (data_file == `NULL) begin
    $display("data_file handle was NULL");
    $finish;
  end
end*/



endmodule
