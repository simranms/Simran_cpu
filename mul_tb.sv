`include "mul.v"
module top;
  
  bit [3:0] a, b;
  bit [7:0] c; 
  
  MUL#(4)  M(
    .a2(a),
    .b2(b),
    .sum2(c)
  );
  
  initial begin
    $monitor("%d * %d = %d",a,b,c);
    #1;
    a = $urandom_range;
    b = $urandom_range;
    #1
   $monitor("[%0t] a=%0d b=%0d c=%0d out=%0h", $time,a,b,out);
    #10;
    $finish;
  end
  
    
  initial begin
     $dumpfile("abc.vcd");
    $dumpvars(0);
  end
endmodule
