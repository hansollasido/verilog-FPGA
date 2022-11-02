module char_lcd_cnt(clk_50, reset, lcd_cnt);
  input clk_50;
  input reset;
  output reg [8:0] lcd_cnt;
  
  always@(posedge clk_50) begin
    if (!reset)
      lcd_cnt <= 9'd0;
    else begin
      if (lcd_cnt==9'b001001101)
        lcd_cnt <= 9'b000001010;
      else
        lcd_cnt <= lcd_cnt+1;
    end
  end
endmodule