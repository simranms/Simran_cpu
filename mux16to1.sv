module mux16to1(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,fn_sel,out);
  parameter N=16;
  input [N-1:0] a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
  input [4:0]fn_sel;
  output reg [N:0] out;
always @ (*) begin
//  always @ (a0 or a1 or a2 or a3 or a4 or a5 or a6 or a7 or a8 or a9 or a10 or a11 or a12 or a13 or a14 or a15 or fn_sel) begin
   case(fn_sel)
      4'b0000:out<=a0;
      4'b0001:out<=a1;
      4'b0010:out<=a2;
      4'b0011:out<=a3;
      4'b0100:out<=a4;
      4'b0101:out<=a5;
      4'b0110:out<=a6;
      4'b0111:out<=a7;
      4'b1000:out<=a8;
      4'b1001:out<=a9;
      4'b1010:out<=a10;
      4'b1011:out<=a11;
      4'b1100:out<=a12;
      4'b1101:out<=a13;
      4'b1110:out<=a14;
      4'b1111:out<=a15;
    endcase
  end
endmodule
