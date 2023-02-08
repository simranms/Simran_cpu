module add_tb;
  reg [2:0]a1;
  reg [2:0]b1;
  reg c1_input;
  wire [3:0]sum1;
  integer i1;
  
  //instantiate
  addr add_dut( .a1(a1), .b1(b1), .c1_input(c1_input), .c1_output(c1_output), .sum1(sum1));
  initial begin 
    a1<=1;
    b1<=1;
    c1_input<=1;
    
    
    for(i1=0;i1<5;i1=i1+1) begin
    
    // $monitor("a1=%0d b1=%0d c1_input=%0d c1_output=%0d sum1=%0d", a1,b1,c1_input, c1_output, sum1);
      
      a1<=$random;
      b1<=$random;
      c1_input<=$random;
    //$dumpfile("dump.vcd");
    //$dumpvars();
    end  
      
  end
endmodule
