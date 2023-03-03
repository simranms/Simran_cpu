`include "subG.v"
module tb();
  reg [15:0]a,b;
  reg bin;
  wire [15:0]sub;
  wire bo;
  a16bitsub dut(.sub_in1(a),.sub_in2(b),.bin(bin),.sub(sub),.bo(bo));
  initial begin
     //a=16'b0000000000001101; b=16'b0000000000001011; bin=16'b0000000000000000;
    a=16'b111;
    b=16'b1110;
    bin=1'b0;
    $monitor("a=%0d b=%0d bin=%0d sub=%0p bo=%0p",a,b,bin,sub,bo);
  end
endmodule
