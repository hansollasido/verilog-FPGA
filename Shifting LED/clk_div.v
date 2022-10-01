`timescale 1ns / 1ns

module clk_div_100(clk, clk_100);
input clk;
output reg clk_100=0;

reg [15:0] clk_cnt=0;
always@(posedge clk) begin
        if(clk_cnt==16'd49999)begin
            clk_100 <= ~clk_100;
            clk_cnt <= 19'd0;
        end
        else begin
            clk_cnt <= clk_cnt + 1;
        end
    end
endmodule
