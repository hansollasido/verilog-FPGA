module mac(clk, in1, in2, in3, out);

  input clk;
  input [38:0] in1;
  input [38:0] in2;
  input [38:0] in3;
  //input signed [12:0] filter3x3 [0:2] [0:2];
  output reg signed [12:0] out = 12'b000000000000;

  wire signed [12:0] in [0:2] [0:2];
  wire signed [12:0] filter [0:2] [0:2];
  reg signed [12:0] mul [0:2] [0:2];
  reg signed [12:0] out_temp = 12'b000000000000;
  integer i, j;

  assign in[0][0] = in1[12:0];
  assign in[0][1] = in1[25:13];
  assign in[0][2] = in1[38:26];
  assign in[1][0] = in2[12:0];
  assign in[1][1] = in2[25:13];
  assign in[1][2] = in2[38:26];
  assign in[2][0] = in3[12:0];
  assign in[2][1] = in3[25:13];
  assign in[2][2] = in3[38:26];

  assign filter[0][0] = 2;
  assign filter[0][1] = -2;
  assign filter[0][2] = -1;
  assign filter[1][0] = -1;
  assign filter[1][1] = 2;
  assign filter[1][2] = 1;
  assign filter[2][0] = 4;
  assign filter[2][1] = 5;
  assign filter[2][2] = 1;

  always @(posedge clk) begin
    for (i=0; i<3; i=i+1) begin
      for (j=0; j<3; j=j+1) begin
        mul[i][j] = in[i][j] * filter[i][j];
        out_temp = out_temp + mul[i][j];
      end
    end
    /*for (i=0; i<3; i=i+1) begin
      for (j=0; j<3; j=j+1) begin
        #10 assign out = out + mul[i][j];
      end
    end*/
  #10 out = out_temp;
  end

/*
  always @(posedge clk) begin
    for (i=0; i<3; i=i+1) begin
      for (j=0; j<3; j=j+1) begin
        #10 out = out + mul[i][j];
      end
    end
  end*/

endmodule
