module demux1to16(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,fn_sel,in);
   parameter N=16;
  input [N-1:0] in ;
  input [4:0]fn_sel;
  output reg [N-1:0] a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
 
 
  always@(*) begin
    case(fn_sel)
      4'b0000:a0<=in;
      4'b0001:a1<=in;
      4'b0010:a2<=in;
      4'b0011:a3<=in;
      4'b0100:a4<=in;
      4'b0101:a5<=in;
      4'b0110:a6<=in;
      4'b0111:a7<=in;
      4'b1000:a8<=in;
      4'b1001:a9<=in;
      4'b1010:a10<=in;
      4'b1011:a11<=in;
      4'b1100:a12<=in;
      4'b1101:a13<=in;
      4'b1110:a14<=in;
      4'b1111:a15<=in;
    endcase
  end
endmodule
