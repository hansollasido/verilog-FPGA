`timescale 1ns / 1ns

module seg(
bcd, seg
    );
input [4:0]bcd;
output reg [6:0]seg;

always@(bcd)begin
        case (bcd)
          0 : seg = 7'b1111110;
          1 : seg = 7'b0110000;
          2 : seg = 7'b1101101;
          3 : seg = 7'b1111001;
          4 : seg = 7'b0110011;
          5 : seg = 7'b1011011;
          6 : seg = 7'b0011111;
          7 : seg = 7'b1110000;
          8 : seg = 7'b1111111;
          9 : seg = 7'b1110011;
          default : seg = 7'b0000000;
        endcase
end
    
    
endmodule
