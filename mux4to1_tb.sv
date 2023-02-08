module mux4to1_tb;
  parameter N=4;
  reg [N-1:0]a;
  reg [N-1:0]b;
  reg [N-1:0]c;
  reg [N-1:0]d;
  wire [N-1:0]out;
  reg [1:0]fn_sel;
  integer i;
  
  //instantiate
  mux4to1 mux0( .a(a), .b(b), .c(c), .d(d), .fn_sel(fn_sel), .out(out));
  initial begin
   // $monitor("[%0t] fn_sel=%0d a=%0d b=%0d c=%0d d=%0d out=%0h", $time,fn_sel,a,b,c,d,out);
    fn_sel<=0;
    a<=$random;
    b<=$random;
    c<=$random;
    d<=$random;
    
    for(i=0;i<5;i=i+1) begin
    #2 fn_sel<=i;
      
    end

  end
endmodule 
