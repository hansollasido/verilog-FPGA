
`timescale 1ns / 1ns

module full_add(in1,in2,cin,s,cout);

input in1;
input in2;
input cin;
output s,cout;

assign s = (in1^in2)^cin;
assign cout = ((in1&in2) | ((in1^in2)&cin));

endmodule

module change(in,out);
    input [5:0]in;
    output [5:0]out;
    
    assign out = ~in;
endmodule

module delay1(in,clk,out);
    input in,clk;
    output reg out;
    
    always@(posedge clk)begin
        out<=in;
    end
endmodule

module delay2(in,clk,out);
    input in,clk;
    output reg out;
    
    reg r_data;
    
    always@(posedge clk) begin
    
        r_data <= in;
        out <= r_data;
    end    
    
endmodule

module delay3(in,clk,out);
    input in,clk;
    output reg out;
    
    reg [1:0]r_data;
    
    always@(posedge clk)begin
    
        r_data[0] <= in;
        r_data[1] <= r_data[0];
        out <= r_data[1];
    end
endmodule

module delay4(in,clk,out);
    input in,clk;
    output reg out;
    
    reg [2:0]r_data;
    
    always@(posedge clk)begin
    
        r_data[0] <= in;
        r_data[1] <= r_data[0];
        r_data[2] <= r_data[1];
        out <= r_data[2];
    end
endmodule

module delay5(in,clk,out);
    input in,clk;
    output reg out;
    
    reg [3:0]r_data;
    
    always@(posedge clk)begin
    
        r_data[0] <= in;
        r_data[1] <= r_data[0];
        r_data[2] <= r_data[1];
        r_data[3] <= r_data[2];
        out <= r_data[3];
    end
endmodule

module delay6(in,clk,out);
    input in,clk;
    output reg out;
    
    reg [4:0]r_data;
    
    always@(posedge clk)begin
    
        r_data[0] <= in;
        r_data[1] <= r_data[0];
        r_data[2] <= r_data[1];
        r_data[3] <= r_data[2];
        r_data[4] <= r_data[3];
        out <= r_data[4];
    end
endmodule

module delay7(in,clk,out);
    input in,clk;
    output reg out;
    
    reg [5:0]r_data;
    
    always@(posedge clk)begin
    
        r_data[0] <= in;
        r_data[1] <= r_data[0];
        r_data[2] <= r_data[1];
        r_data[3] <= r_data[2];
        r_data[4] <= r_data[3];
        r_data[5] <= r_data[4];
        out <= r_data[5];
    end
endmodule

module delay7_5(in,clk,out);
    input [4:0]in;
    input clk;
    output reg [4:0]out;
    
    reg [4:0]r_data[0:5];
    
    always@(posedge clk)begin
    
        r_data[0] <= in;
        r_data[1] <= r_data[0];
        r_data[2] <= r_data[1];
        r_data[3] <= r_data[2];
        r_data[4] <= r_data[3];
        r_data[5] <= r_data[4];
        out <= r_data[5];
    end
endmodule

module delay8(in,clk,out);
    input in,clk;
    output reg out;
    
    reg [6:0]r_data;
    
    always@(posedge clk)begin
    
        r_data[0] <= in;
        r_data[1] <= r_data[0];
        r_data[2] <= r_data[1];
        r_data[3] <= r_data[2];
        r_data[4] <= r_data[3];
        r_data[5] <= r_data[4];
        r_data[6] <= r_data[5];
        out <= r_data[6];
    end
endmodule


module adder(clk,in1,in2,cin,s);
    input clk;
    input [6:0]in1;
    input [6:0]in2;
    input cin;
    output [6:0]s;
    
    wire [6:0]in1_1;
    wire [6:0]in2_1;
    wire cin2;
    wire [6:0]c;
    wire [5:0]c2;
    wire [6:0]out;
    
    delay1 d1(in1[0],clk,in1_1[0]);
    delay1 d2(in2[0],clk,in2_1[0]);
    delay1 d3(cin,clk,cin2);
    full_add add1(in1_1[0],in2_1[0],cin2,out[0],c[0]);
    delay6 d4(out[0],clk,s[0]);
    
    delay1 d5(c[0],clk,c2[0]);
    delay2 d6(in1[1],clk,in1_1[1]);
    delay2 d7(in2[1],clk,in2_1[1]);
    full_add add2(in1_1[1],in2_1[1],c2[0],out[1],c[1]);
    delay5 d8(out[1],clk,s[1]);
    
    delay1 d9(c[1],clk,c2[1]);
    delay3 d10(in1[2],clk,in1_1[2]);
    delay3 d11(in2[2],clk,in2_1[2]);
    full_add add3(in1_1[2],in2_1[2],c2[1],out[2],c[2]);
    delay4 d12(out[2],clk,s[2]);
    
    delay1 d13(c[2],clk,c2[2]);
    delay4 d14(in1[3],clk,in1_1[3]);
    delay4 d15(in2[3],clk,in2_1[3]);
    full_add add4(in1_1[3],in2_1[3],c2[2],out[3],c[3]);
    delay3 d16(out[3],clk,s[3]);
    
    delay1 d17(c[3],clk,c2[3]);
    delay5 d18(in1[4],clk,in1_1[4]);
    delay5 d19(in2[4],clk,in2_1[4]);
    full_add add5(in1_1[4],in2_1[4],c2[3],out[4],c[4]);
    delay2 d20(out[4],clk,s[4]);
    
    delay1 d21(c[4],clk,c2[4]);
    delay6 d22(in1[5],clk,in1_1[5]);
    delay6 d23(in2[5],clk,in2_1[5]);
    full_add add6(in1_1[5],in2_1[5],c2[4],out[5],c[5]);
    delay1 d24(out[5],clk,s[5]);
    
    delay1 d25(c[5],clk,c2[5]);
    delay7 d26(in1[6],clk,in1_1[6]);
    delay7 d27(in2[6],clk,in2_1[6]);
    full_add add7(in1_1[6],in2_1[6],c2[5],out[6],c[6]);
    
    assign s[6] = out[6];

endmodule

module sub2(clk,in1,in2,cin,s2);
    input clk;
    input [6:0]in1;
    input [6:0]in2;
    input cin;
    output [6:0]s2;
    wire [6:0]s;
    wire [6:0]in1_1;
    wire [6:0]in2_1;
    wire cin2;
    wire [6:0]c;
    wire [5:0]c2;
    wire [6:0]out;
    
wire a2;
wire a3;
assign a2 = 1;
    delay1 d111(in1[0],clk,in1_1[0]);
    delay1 d211(in2[0],clk,in2_1[0]);
    delay1 d311(cin,clk,cin2);
    full_add add111(in1_1[0],in2_1[0],cin2,out[0],c[0]);
    delay6 d411(out[0],clk,s[0]);
    
    delay1 d511(c[0],clk,c2[0]);
    delay2 d611(in1[1],clk,in1_1[1]);
    delay2 d711(in2[1],clk,in2_1[1]);
    full_add add211(in1_1[1],in2_1[1],c2[0],out[1],c[1]);
    delay5 d811(out[1],clk,s[1]);
    
    delay1 d911(c[1],clk,c2[1]);
    delay3 d1011(in1[2],clk,in1_1[2]);
    delay3 d1111(in2[2],clk,in2_1[2]);
    full_add add311(in1_1[2],in2_1[2],c2[1],out[2],c[2]);
    delay4 d1211(out[2],clk,s[2]);
    
    delay1 d1311(c[2],clk,c2[2]);
    delay4 d1411(in1[3],clk,in1_1[3]);
    delay4 d1511(in2[3],clk,in2_1[3]);
    full_add add411(in1_1[3],in2_1[3],c2[2],out[3],c[3]);
    delay3 d1611(out[3],clk,s[3]);
    
    delay1 d1711(c[3],clk,c2[3]);
    delay5 d1811(in1[4],clk,in1_1[4]);
    delay5 d1911(in2[4],clk,in2_1[4]);
    full_add add511(in1_1[4],in2_1[4],c2[3],out[4],c[4]);
    delay2 d2011(out[4],clk,s[4]);
    
    delay1 d2111(c[4],clk,c2[4]);
    delay6 d2211(in1[5],clk,in1_1[5]);
    delay6 d2311(in2[5],clk,in2_1[5]);
    full_add add611(in1_1[5],in2_1[5],c2[4],out[5],c[5]);
    delay1 d2411(out[5],clk,s[5]);
    
    delay1 d2511(c[5],clk,c2[5]);
    delay7 d2611(in1[6],clk,in1_1[6]);
    delay7 d2711(in2[6],clk,in2_1[6]);
    full_add add711(in1_1[6],in2_1[6],c2[5],out[6],c[6]);
    
    assign s[6] = out[6];

change change311(s[5:0],s2[5:0]);
delay7 d2811(a2,clk,a3);
assign s2[6] = a3;
endmodule

module change_sign(in,out);
    input [5:0]in;
    output [5:0]out;
    
    assign out[4:0]=in[4:0];
    assign out[5]=~in[5];

endmodule

module sub(clk,in1,in2,out); //in1? ??? ? 
    input clk;
    input [5:0]in1;
    input [5:0]in2;
    output reg[6:0]out;
    
    wire [5:0]change_in1;
    wire [6:0]a1;
    wire [6:0]b1;
    wire [6:0]out1;
    
    wire [5:0]change_in2;
    wire [6:0]a2;
    wire [6:0]b2;
    wire [6:0]out2;

wire [4:0]in_1;
wire [4:0]in_2;

delay7_5 delay_2(in1[4:0],clk,in_1);
delay7_5 delay_3(in2[4:0],clk,in_2);
    //in1? ???? |a| < |b| ? ? 
    assign a1[4:0] = in1[4:0];
    assign a1[5] = 0; // 7bit? ????
    assign b1[4:0] = in2[4:0];
    assign b1[6:5] = 2'b00; // 7bit? ????
    change change0(a1[5:0],change_in1); //~? ??
    adder adder1(clk,{1'b1,change_in1},b1,1,out1); // a? ??? ??? ???
    
    //in1? ???? |a| > |b| ? ? 
    assign a2[4:0] = in1[4:0];
    assign a2[5] = 0; // 7bit? ????
    assign b2[4:0] = in2[4:0];
    assign b2[6:5] = 2'b00; // 7bit? ????
    change change3(a2[5:0],change_in2); //~? ??
    sub2 sub3(clk,{1'b1,change_in2},b2,0,out2); // a? ??? ??? ???
    
    
    always@(*)begin
        if(in_1<=in_2)begin
            out=out1;
        end
        else if(in_1>in_2)begin
            out=out2;
        end
    end
endmodule

module top_sign(clk,select,a,b,s);
input clk;
input select;
input [5:0]a;
input [5:0]b;
output reg [6:0]s;

wire select2;
wire [5:0]in1;
wire [5:0]in2;
wire [6:0]out1;
wire [5:0]in3;
wire [5:0]in4;
wire [5:0]in5;
wire [5:0]in6;
wire [5:0]in7;
wire [5:0]in8;
wire [5:0]in9;
wire [5:0]in10;
wire [6:0]out2;
wire [6:0]out3;
wire [6:0]out4;
wire [6:0]out5;
wire aa;
wire bb;


assign in1 = a;
assign in2 = b;
assign in3 = a;
assign in4 = b;
assign in5 = a;
assign in6 = b;
assign in7 = a;
assign in8[4:0] = b[4:0];
assign in9 = a;
assign in10[4:0] = b[4:0];


//change_sign change1(in7,in8); //a? ?? ??
//change_sign change2(in9,in10); //b? ?? ??

//a,b ?? ?? ? ?
adder adder0(clk,{1'b0,in1},{1'b0,in2},0,out1); //a+b, -a-b
sub sub0(clk,in3,in4,out2); //-a+b
sub sub1(clk,in6,in5,out3); //-b+a

assign in8[5]=0;
adder adder9(clk,{1'b0,in7},{1'b0,in8},0,out4); 


assign in10[5]=1;
adder adder10(clk,{1'b0,in9},{1'b0,in10},0,out5);

delay7 d28(select,clk,select2);
delay7 d_5(a[5],clk,aa);
delay7 d_6(b[5],clk,bb);


always @ (*) begin
    if((aa==0) && (bb==0) && (select2==0))begin // ?) 000111+001001
        s = out1;
        end
    else if((aa==0) && (bb==0) && (select2==1))begin // 000111-001001
        s = out3;
        end
    else if((aa==0) && (bb==1) && (select2==0))begin // 000111+101001 = 000111-001001
        s = out3;
        end
    else if((aa==0) && (bb==1) && (select2==1))begin // 000111-101001 = 000111+001001
        s = out4;
        end
    else if((aa==1) && (bb==0) && (select2==0))begin // 100111+001001 = -000111+001001
        s = out2;
        end
    else if((aa==1) && (bb==0) && (select2==1))begin // 100111-001001 = -000111-001001
        s = out5;
        end
    else if((aa==1) && (bb==1) && (select2==0))begin // 100111+101001 = -000111-001001
        s = out1;
        end
    else if((aa==1) && (bb==1) && (select2==1))begin // 100111-101001 = -000111+001001
        s = out2;
        end
end 


endmodule


module tb_Sign_and_Magnitude();
reg clk=0;
reg select;
reg [5:0]in1;
reg [5:0]in2;
wire [6:0]sum;
//wire select2;


//delay8 delay28(select,clk,select2);
top_sign top_sign0(clk,select,in1,in2,sum);

always #5 clk=~clk;

initial begin

//    A,B ?? ??
    select=0;in1=6'b000111;in2=6'b000001; // a > b
    #50
    select=1;in1=6'b000111;in2=6'b000001; // a > b
    #50
    select=0;in1=6'b000011;in2=6'b001011; // a < b
    #50
    select=1;in1=6'b000101;in2=6'b001001; // a < b
    #50
//    A,B ?? ??
    select=0;in1=6'b101011;in2=6'b100001; // a > b 
    #50
    select=0;in1=6'b101010;in2=6'b100110; // a > b
    #50
    select=1;in1=6'b100010;in2=6'b101011; // a < b
    #50
    select=1;in1=6'b100011;in2=6'b100110; // a < b

    //A,B -,+
//    select=0;in1=6'b101011;in2=6'b000001; // a > b 
//    #50
//    select=1;in1=6'b101010;in2=6'b000110; // a > b
//    #50
//    select=0;in1=6'b100010;in2=6'b001011; // a < b
//    #50
//    select=0;in1=6'b100011;in2=6'b000110; // a < b
//    #50
    //A,B +,-
//    select=0;in1=6'b001011;in2=6'b100001; // a > b 
//    #50
//    select=1;in1=6'b001010;in2=6'b100110; // a > b
//    #50
//    select=0;in1=6'b000010;in2=6'b101011; // a < b
//    #50
//    select=1;in1=6'b000011;in2=6'b100110; // a < b

end

endmodule