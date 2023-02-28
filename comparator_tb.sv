module tb;
  //parameter N=16;
  reg [15:0]in1,in2;
  wire comp;
  comp_16_bit c11(in1,in2,comp);
   /*instantiate
  comp_1_bit c1( .in1(in1[0]), .in2(in2[0]), .a_less_b(t1), .a_greater_b(t2), .equal(t3));
  comp_1_bit c2( .in1(in1[1]), .in2(in2[1]), .a_less_b(t4), .a_greater_b(t5), .equal(t6));
  comp_1_bit c3( .in1(in1[2]), .in2(in2[2]), .a_less_b(t7), .a_greater_b(t8), .equal(t9));
  comp_1_bit c4( .in1(in1[3]), .in2(in2[3]), .a_less_b(t10), .a_greater_b(t11), .equal(t12));
  
  comp_4_bit c5( .in1(in1[3:0]), .in2(in2[3:0]), .a_less_b(t1), .a_greater_b(t2), .equal(t3));
  comp_4_bit c6( .in1(in1[7:4]), .in2(in2[7:4]), .a_less_b(t4), .a_greater_b(t5), .equal(t6));
  comp_4_bit c7( .in1(in1[11:8]), .in2(in2[11:8]), .a_less_b(t7), .a_greater_b(t8), .equal(t9));
  comp_4_bit c8( .in1(in1[15:12]), .in2(in2[15:12]), .a_less_b(t10), .a_greater_b(t11), .equal(t12));
  */
  initial begin
    in1=16'b111101;
    in2=16'b111110;
    $monitor("comp=%0b",comp);
  end
endmodule
