`include "mux16to1.v"
module mux16to1_tb;
  parameter N=16;
  wire [N-1:0]out;
  reg [N-1:0]a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
  reg [4:0]fn_sel;
  integer i;
  
  mux16to1 dut( .a0(a0), .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), .a6(a6), .a7(a7), .a8(a8), .a9(a9), .a10(a10), .a11(a11), .a12(a12), .a13(a13), .a14(a14), .a15(a15), .fn_sel(fn_sel),.out(out));
  
  initial begin
    $monitor("[%0t] a0=%0d a1=%0d a2=%0d a3=%0d a4=%0d a5=%0d a6=%0d a7=%0d a8=%0d a9=%0d a10=%0d a11=%0d a12=%0d a13=%0d a14=%0d a15=%0d fn_sel=%0d out=%0d ",$time,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,fn_sel,out);
   fn_sel<=0;
    a0 = $random;
    a1 = $random;
    a2 = $random;
    a3 = $random;
    a4 = $random;
    a5 = $random;
    a6 = $random;
    a7 = $random;
    a8 = $random;
    a9 = $random;
    a10 = $random;
    a11 = $random;
    a12 = $random;
    a13 = $random;
    a14 = $random;
    a15 = $random;
    
       for(i=0;i<5;i=i+1) begin
    #2 fn_sel<=i;
      
    end
  end
endmodule
