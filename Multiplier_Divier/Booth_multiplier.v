module Booth(
	input [7:0]a,
	input [7:0]b,
	input clk,
	output [15:0]s
);

	wire [8:0]a1, start;
	assign a1 = 16'b0000_0000_0000_0000;
	assign start = {1'b0,a[7:0]};
	
	reg [15:0]k;

	always@(*) begin
		if(a[7]==0) begin
			k[8:0] = {1'b0,a[7:0]};
		end
		else if(a[7]==1) begin
			k[8:0] = {1'b1,a[7:0]};
		end
		
	go f1(a,b[0],k);
	go f2(a,b[1],k);
	PLCLA16 u1(clk,
	
	PLCLA16 u6(clk,ed,rd,1'b0,s2,c[1]);
	PLCLA16 u7(clk,s1,s2,1'b0,s,c[2]);

	go f1(a,b[0],a1);
	go f2(a,b[1],a2);
	go f3(a,b[2],a3);

	assign ad2=a2<<1;
	assign zd=z<<4;
	
module go(
input [15:0]a,
input b,
input [3:0]count,
output [15:0]s
);
reg [15:0]k;
	always@(*)begin
		if(b==0)begin
			k=0;
		end
		else if(b==1)begin
			k[7:0]=a;
		end
		if(a[7]==0)begin
			k[8]=0;
		end
		else if(a[7]==1)begin
			k[8]=1;
		end

module Booth( //?? BOOTH ? ??
input [7:0]a,  //8?? ??(M)
input [7:0]b, //8?? ??
input clk,
output [15:0]s //?? ??
);

wire [8:0]bc; //b? ? ?? 0? ??
wire [15:0]q,w,e,r; //CHECK??? ?? ? ?? ??
wire [15:0]wd,ed,rd; //???? ???? ?
wire [2:0]c; //??? ????
wire [15:0]s1,s2; //? ?? CLA?? ? ? ?? CLA??
assign bc={b[7:0],1'b0}; //??

check u1(a,bc[2:0],q); 
check u2(a,bc[4:2],w);
check u3(a,bc[6:4],e);
check u4(a,bc[8:6],r);

assign wd=w<<2; //????? ?? ???
assign ed=e<<4;
assign rd=r<<6;

PLCLA16 u5(clk,q,wd,1'b0,s1,c[0]);
PLCLA16 u6(clk,ed,rd,1'b0,s2,c[1]);
PLCLA16 u7(clk,s1,s2,1'b0,s,c[2]);

endmodule

module check( //????? 3???? ?? ???? ????? ?? ?? ???? 16                                    ??? ??
input [7:0]a, //???
input [2:0]b, //????? 3??
output reg [15:0]s //16?? ??? ??
);
reg [15:0]k; //???? ??? ?? 16??? ??????
always@(*) begin
  if(a[7]==1) begin 
    k[15:8]=8'b1111_1111; //MSB? 1???
    k[7:0]=a;
  end
  else if(a[7]==0) begin //MSB? 0???
    k[15:8]=8'b0000_0000;
    k[7:0]=a;
  end
  if(b==3'b000||b==3'b111)  //?? 3????? ?? ?? S??
    s=16'b0000_0000_0000_0000;
  else if(b==3'b001||b==3'b010)
    s=k;
  else if(b==3'b011)
    s=k<<1;
  else if(b==3'b100)
    s=(~k+1'b1)<<1;
  else if(b==3'b101||b==3'b110)
    s=(~k+1'b1);
end

endmodule

`timescale 1ns/1ns
module tb_Booth();
  reg [7:0]a;
  reg [7:0]b;
  reg clk;
  wire [15:0]s;
  
  always #5 clk=~clk;
  Booth u0(a,b,clk,s);
  initial begin
    a=8'b1000_0101; b=8'b0001_0010; clk=1'b0;
    #30
    a=8'b0000_0001; b=8'b0000_0001; 
    #20
    a=8'b0110_0101; b=8'b0001_0010; 
    #30
    a=8'b1000_0101; b=8'b0101_0110; 
    #30
    a=8'b1011_0101; b=8'b0001_0010; 
  end
endmodule
