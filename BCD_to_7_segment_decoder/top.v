
module top(clk,o,o2,o3);
    
input clk;
output reg [6:0]o;
output reg o2;
output reg [7:0]o3;
wire [55:0]out;
wire clk_100;
integer i = 0;
wire [39:0]a;
assign a=40'b00001_01001_01001_01000_00000_00001_00000_00010;

clk_div_100 div0(clk, clk_100);
seg seg0(a[39:35],out[6:0]);
seg seg1(a[34:30],out[13:7]);
seg seg2(a[29:25],out[20:14]);
seg seg3(a[24:20],out[27:21]);
seg seg4(a[19:15],out[34:28]);
seg seg5(a[14:10],out[41:35]);
seg seg6(a[9:5],out[48:42]);
seg seg7(a[4:0],out[55:49]);


always@(posedge clk_100)begin
	    if(i<9)begin
	    o3 = 0;
	    o3[i] = 1;
            o2 = 0;
            o= out[7*i +: 7];
            i = i + 1;

		if(i==4)begin
                	o2 = 1;
            	end
            	else if(i==6)begin
                	o2 = 1;
            	end
            	else if(i==8)begin
                	o2 = 1;
			i = 0;
            	end

	    end
            
        

end

endmodule