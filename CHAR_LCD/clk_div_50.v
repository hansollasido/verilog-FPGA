module clk_div_50 (clk, reset, clk_50);
  input clk, reset;
  output reg clk_50=0;
  
  reg [23:0] clk_cnt=0;
  
  always @ (posedge clk)
    if (!reset) begin
      clk_50 <= 0;
      clk_cnt <= 0;
    end
    else begin
      if (clk_cnt==24'd999999) begin
        clk_50 <= ~clk_50;
        clk_cnt <= 24'd0;
      end
      else begin
        clk_cnt <= clk_cnt+1;
      end
    end
endmodule

