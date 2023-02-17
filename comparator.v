module comp_1_bit(in1,in2,a_less_b,a_greater_b,equal);
  //registers
  //parameter N=16;
  input in1,in2;
  output reg a_less_b,a_greater_b,equal;
  wire t1,t2;
  //assign gates
  not n1(t1,in2);
  and a1(a_greater_b,t1,in1);
  xnor x1(equal,in1,in2);
  not n2(t2,in1);
  and a2(a_less_b,t2,in2);
  
endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////
module comp_4_bit(in1,in2,a_less_b,a_greater_b,equal);
  //registers
  input [3:0]in1,in2;
  output reg a_less_b,a_greater_b,equal;
  wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12;
  wire y1,y2,y3,y4,y5,y6;
  //instantiate
  comp_1_bit c1( .in1(in1[0]), .in2(in2[0]), .a_less_b(t1), .a_greater_b(t2), .equal(t3));
  comp_1_bit c2( .in1(in1[1]), .in2(in2[1]), .a_less_b(t4), .a_greater_b(t5), .equal(t6));
  comp_1_bit c3( .in1(in1[2]), .in2(in2[2]), .a_less_b(t7), .a_greater_b(t8), .equal(t9));
  comp_1_bit c4( .in1(in1[3]), .in2(in2[3]), .a_less_b(t10), .a_greater_b(t11), .equal(t12));
  //assign gates
  and b1(y1,t2,t6,t9,t12);
  and b2(y2,t1,t6,t9,t12);
  and b3(y3,t5,t9,t12);
  and b4(y4,t4,t9,t12);
  and b5(y5,t8,t12);
  and b6(y6,t7,t12);
  and b7(equal,t3,t6,t9,t12);
  or b8(a_greater_b,y1,y3,y5,t11);
  or b9(a_less_b,y2,y4,y6,t10);
  
endmodule
/////////////////////////////////////////////////////////////////////////////////////////////////////
module comp_16_bit(in1,in2,comp);
  //registers
  input [15:0]in1,in2;
  output reg comp;
  wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12;
  wire y1,y2,y3,y4,y5,y6,a_less_b,a_greater_b,equal;
  wire [1:0]op1;
  //instantiate
  comp_4_bit c5( .in1(in1[3:0]), .in2(in2[3:0]), .a_less_b(t1), .a_greater_b(t2), .equal(t3));
  comp_4_bit c6( .in1(in1[7:4]), .in2(in2[7:4]), .a_less_b(t4), .a_greater_b(t5), .equal(t6));
  comp_4_bit c7( .in1(in1[11:8]), .in2(in2[11:8]), .a_less_b(t7), .a_greater_b(t8), .equal(t9));
  comp_4_bit c8( .in1(in1[15:12]), .in2(in2[15:12]), .a_less_b(t10), .a_greater_b(t11), .equal(t12));
  //assign gates
  and b10(y1,t2,t6,t9,t12);
  and b11(y2,t1,t6,t9,t12);
  and b12(y3,t5,t9,t12);
  and b13(y4,t4,t9,t12);
  and b14(y5,t8,t12);
  and b15(y6,t7,t12);
  and b16(equal,t3,t6,t9,t12);
  or b17(a_greater_b,y1,y3,y5,t11);
  or b18(a_less_b,y2,y4,y6,t10);
  //logic
  assign op1={a_less_b,a_greater_b};
  always@(op1)begin
    case(op1)
      2'b00 : begin 
        comp = equal;
        $display("in1=in2");
      end
      2'b01 : begin
        comp = a_greater_b;
        $display("in1>in2");
      end
      2'b10 :begin
        comp = a_less_b;
        $display("in1<in2");
      end
    endcase
  end
  
endmodule
 
