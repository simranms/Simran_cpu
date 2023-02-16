module demux1to16_tb;
  parameter N=16;
  wire [N-1:0]a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
  reg [N-1:0]in;
  reg [4:0]fn_sel;
  integer i;
  
  //instantiate
  demux1to16 dut( .in(in), .a0(a0), .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), .a6(a6), .a7(a7), .a8(a8), .a9(a9), .a10(a10), .a11(a11), .a12(a12), .a13(a13), .a14(a14), .a15(a15), .fn_sel(fn_sel));
  
  initial begin
    //$monitor("[%0t] fn_sel=%0d in=%0d a0=%0d a1=%0d a2=%0d a3=%0d a4=%0d a5=%0d a6=%0d a7=%0d a8=%0d a9=%0d a10=%0d a11=%0d a12=%0d a13=%0d a14=%0d a15=%0d", $time,fn_sel,in,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15);
    fn_sel<=0;
    in<=$urandom;
    for(i=0;i<5;i=i+1) begin
    #2 fn_sel<=i;
      
    end

  end
endmodule 
