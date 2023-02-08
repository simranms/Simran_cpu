module mux4to1(a,b,c,d,fn_sel,out);
   parameter N=4;
  input [N-1:0] a,b,c,d;
  input [1:0]fn_sel;
  output reg [N-1:0] out;
 
 
  always@(a or b or c or d or fn_sel) begin
    case(fn_sel)
    4'b00:out<=a;
    4'b01:out<=b;
    4'b10:out<=c;
    4'b11:out<=d;
    endcase
  end
endmodule
