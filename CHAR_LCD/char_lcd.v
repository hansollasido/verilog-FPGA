module char_cld (clk,reset,lcd_e,lcd_rs,lcd_rw,lcd_db);
  input clk, reset;
  output lcd_e, lcd_rs, lcd_rw;
  output [7:0]lcd_db;
  
  wire clk_50;
  wire [8:0] lcd_cnt;
  
  reg [8:0] char00,char01,char02,char03,char04,char05,char06,char07,char08,char09,char0A,char0B,char0C,char0D,char0E,char0F;
  reg [8:0] char10,char11,char12,char13,char14,char15,char16,char17,char18,char19,char1A,char1B,char1C,char1D,char1E,char1F;
  
  clk_div_50 clk_div00 (clk, reset, clk_50);
  char_lcd_cnt cnt00 (clk_50, reset, lcd_cnt);
  char_lcd_cont cont00 (lcd_cnt,char00,char01,char02,char03,char04,char05,char06,char07,char08,char09,char0A,char0B,char0C,char0D,char0E,char0F,
    char10,char11,char12,char13,char14,char15,char16,char17,char18,char19,char1A,char1B,char1C,char1D,char1E,char1F,lcd_db,lcd_rs,lcd_rw,lcd_e);
  
  initial begin 
    char00 = 8'h4D;
    char01 = 8'h79;
    char02 = 8'h20;
    char03 = 8'h6E;
    char04 = 8'h61;
    char05 = 8'h6D;
    char06 = 8'h65;
    char07 = 8'h20;
    char08 = 8'h69;
    char09 = 8'h73;
    char0A = 8'h20;
    char0B = 8'h20;
    char0C = 8'h20;
    char0D = 8'h20;
    char0E = 8'h20;
    char0F = 8'h20;
    
    
    char10 = 8'h4B;
    char11 = 8'h69;
    char12 = 8'h6D;
    char13 = 8'h48;
    char14 = 8'h61;
    char15 = 8'h6E;
    char16 = 8'h20;
    char17 = 8'h53;
    char18 = 8'h6F;
    char19 = 8'h6C;
    char1A = 8'h20;
    char1B = 8'h20;
    char1C = 8'h20;
    char1D = 8'h20;
    char1E = 8'h20;
    char1F = 8'h20;
  end
endmodule