`timescale 1ns / 1ps




module tb();
reg clk=0;
wire [6:0]out;
wire o;
wire [7:0]digit;

top top0(clk,out,o,digit);

always #5 clk=~clk;


endmodule
