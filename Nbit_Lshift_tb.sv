 `include "Nbit_Lshift.v"
module tb;
  parameter N=16;
  reg [N-1:0] D,d;
  //reg [N-1:0]d;
  wire [N-1:0][N-1:0]o;
  nbitshift m1(.D(D),.d(d),.o(o));
  
  initial begin
   
       D='hffff; d=101;
    #2 D='hffff; d=110;
    
    //#1 D=5'b10111;
    #100 $finish;
  end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
     $monitor("D=%0b, o=%0p ",D,o);
    
  end
  
endmodule
