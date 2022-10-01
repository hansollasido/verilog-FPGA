`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 19:00:09
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(clk, reset, out);
input clk;
input reset;
output [15:0]out;

wire clk_100;
    
clk_div_100 clk100(clk, reset, clk_100);
counter c0(reset, clk_100, out);    
    
    
endmodule
