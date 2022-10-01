`timescale 1ns / 100ps


module tb_clk();
reg clk = 0;
reg reset=1;
wire [15:0]out;


top top0(clk,reset,out);

always #5 clk=~clk;

initial begin
    #5820000 reset = 0;
    #112 reset=1;
end

endmodule