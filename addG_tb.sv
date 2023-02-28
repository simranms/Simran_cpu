module tb;
  wire  [15:0] sum;
  wire  [15:0]cout;
  reg [15:0] add_in1, add_in2;
  reg cin;
  full_adder_16 dut(add_in1,add_in2,cin,sum,cout);
  initial begin
    add_in1 = 16'b1000000010;
    add_in2 = 16'b10;
   //add_in1 = $urandom;
   //add_in2 = $urandom;
   //cin = $urandom;
    cin = 0;
    $monitor("add_in1 %0d add_in2 %0d cin %0d cout %0d sum %0d", add_in1,add_in2,cin,cout,sum);
  end
endmodule
