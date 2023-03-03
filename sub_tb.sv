`include "sub.v"
module sub_tb;
  reg [2:0]c1;
  reg [2:0]d1;
  reg i1_input;
  wire [3:0]sum3;
  integer i2;
  
  //instantiate
  subr sub_dut( .c1(c1), .d1(d1), .i1_input(i1_input), .o1_output(o1_output), .sum3(sum3));
  initial begin 
    c1<=1;
    d1<=1;
    i1_input<=1;
    
   
    for(i2=0;i2<5;i2=i2+1) begin
    
   //$monitor("c1=%0d d1=%0d i1_input=%0d o1_output=%0d sum3=%0d", c1,d1,i1_input, o1_output, sum3);
    
      c1<=$random;
      d1<=$random;
      i1_input<=$random;
    //$dumpfile("dump.vcd");
    //$dumpvars();
    end  
      
  end
endmodule
