module char_lcd_cont(lcd_cnt,char00,char01,char02,char03,char04,char05,char06,char07,char08,char09,char0A,char0B,char0C,char0D,char0E,char0F,
char10,char11,char12,char13,char14,char15,char16,char17,char18,char19,char1A,char1B,char1C,char1D,char1E,char1F,lcd_db,lcd_rs,lcd_rw,lcd_e);
  input [8:0] lcd_cnt;
  input [8:0] char00,char01,char02,char03,char04,char05,char06,char07,char08,char09,char0A,char0B,char0C,char0D,char0E,char0F;
  input [8:0] char10,char11,char12,char13,char14,char15,char16,char17,char18,char19,char1A,char1B,char1C,char1D,char1E,char1F;
  output reg [7:0] lcd_db;
  output lcd_rs, lcd_rw, lcd_e;
  
  wire [7:0] lcd_state;

  assign lcd_state = lcd_cnt[8:1];
  assign lcd_e = lcd_cnt[0];
  assign lcd_rw = 1'b0;
  assign lcd_rs = !((lcd_state>=8'h00 && lcd_state<=8'h05)||(lcd_state==8'h16));
  
  always @ (*) begin
    case (lcd_state)
      8'h00 : lcd_db = 8'b0011_1000; // Function Set
      8'h01 : lcd_db = 8'b0000_1000; // Display Off
      8'h02 : lcd_db = 8'b0000_0001; // Display Clear
      8'h03 : lcd_db = 8'b0000_0110; // Entry Mode Set
      8'h04 : lcd_db = 8'b0000_1100; // Display On
      
      8'h05 : lcd_db = 8'b0000_0011; // Return Home
      
      8'h06 : lcd_db = char00;
      8'h07 : lcd_db = char01;
      8'h08 : lcd_db = char02;
      8'h09 : lcd_db = char03;
      8'h0A : lcd_db = char04;
      8'h0B : lcd_db = char05;
      8'h0C : lcd_db = char06;
      8'h0D : lcd_db = char07;
      8'h0E : lcd_db = char08;
      8'h0F : lcd_db = char09;
      8'h10 : lcd_db = char0A;
      8'h11 : lcd_db = char0B;
      8'h12 : lcd_db = char0C;
      8'h13 : lcd_db = char0D;
      8'h14 : lcd_db = char0E;
      8'h15 : lcd_db = char0F;
      
      8'h16 : lcd_db = 8'hC0; // Change Line
      
      8'h17 : lcd_db = char10;
      8'h18 : lcd_db = char11;
      8'h19 : lcd_db = char12;
      8'h1A : lcd_db = char13;
      8'h1B : lcd_db = char14;
      8'h1C : lcd_db = char15;
      8'h1D : lcd_db = char16;
      8'h1E : lcd_db = char17;
      8'h1F : lcd_db = char18;
      8'h20 : lcd_db = char19;
      8'h21 : lcd_db = char1A;
      8'h22 : lcd_db = char1B;
      8'h23 : lcd_db = char1C;
      8'h24 : lcd_db = char1D;
      8'h25 : lcd_db = char1E;
      8'h26 : lcd_db = char1F;
      
      default : lcd_db = 8'h00;
    endcase
  end
endmodule