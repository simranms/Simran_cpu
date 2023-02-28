module full_adder_16(inp1, inp2, cin,sum, cout);
  input [15:0] inp1,inp2;
  input cin;
  output [15:0] sum;
  output cout;
  wire c1,c2,c3;

  ripple_carry_4_bit rca1 (
    .inp1(inp1[3:0]),
    .inp2(inp2[3:0]),
    .cin(cin), 
    .sum(sum[3:0]),
    .cout(c1));
  ripple_carry_4_bit rca2(
    .inp1(inp1[7:4]),
    .inp2(inp2[7:4]),
    .cin(c1),
    .sum(sum[7:4]),
    .cout(c2));
ripple_carry_4_bit rca3(
  .inp1(inp1[11:8]),
  .inp2(inp2[11:8]),
  .cin(c2),
  .sum(sum[11:8]),
  .cout(c3));
ripple_carry_4_bit rca4(
  .inp1(inp1[15:12]),
  .inp2(inp2[15:12]),
  .cin(c3),
  .sum(sum[15:12]),
  .cout(cout));
always@(*)begin
  if(cout>0)
    $display(".........exception........");
  end
endmodule

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//4-bit Ripple Carry Adder
module ripple_carry_4_bit(inp1, inp2, cin, sum, cout);
  input [3:0] inp1,inp2;
  input cin;
  wire c1,c2,c3;
  output [3:0] sum;
  output cout;

  full_adder fa0(.inp1(inp1[0]), .inp2(inp2[0]),.cin(cin), .sum(sum[0]),.cout(c1));
  full_adder fa1(.inp1(inp1[1]), .inp2(inp2[1]), .cin(c1), .sum(sum[1]),.cout(c2));
  full_adder fa2(.inp1(inp1[2]), .inp2(inp2[2]), .cin(c2), .sum(sum[2]),.cout(c3));
  full_adder fa3(.inp1(inp1[3]), .inp2(inp2[3]), .cin(c3), .sum(sum[3]),.cout(cout));
endmodule

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//1bit Full Adder
module full_adder(inp1,inp2,cin,sum, cout);
  input inp1,inp2,cin;
  output sum, cout;
  wire x,y,z;
  half_adder h1(.inp1(inp1), .inp2(inp2), .sum(x), .cout(y));
  half_adder h2(.inp1(x), .inp2(cin), .sum(sum), .cout(z));
  or or_1(cout,z,y);
endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 1 bit Half Adder
module half_adder( inp1,inp2, sum, cout );
  input inp1,inp2;
  output sum, cout;
  xor xor_1 (sum,inp1,inp2);
  and and_1 (cout,inp1,inp2);
endmodule
