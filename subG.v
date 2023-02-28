//16bit subtractor
module a16bitsub(inp1,inp2,bin,sub,bo);
  parameter N=16;
  input [N-1:0]inp1,inp2;
  input bin;
  output reg [N-1:0]sub;
  output reg bo;
  wire b11,b12,b13;
  a4bitsub af0(.inp1(inp1[3:0]),.inp2(inp2[3:0]),.bin(bin),.sub(sub[3:0]),.bo(b11));
  a4bitsub af1(.inp1(inp1[7:4]),.inp2(inp2[7:4]),.bin(b11),.sub(sub[7:4]),.bo(b12));
  a4bitsub af2(.inp1(inp1[11:8]),.inp2(inp2[11:8]),.bin(b12),.sub(sub[11:8]),.bo(b13));
  a4bitsub af3(.inp1(inp1[15:12]),.inp2(inp2[15:12]),.bin(b13),.sub(sub[15:12]),.bo(bo));
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//4 bit subtractor
module a4bitsub(inp1,inp2,bin,sub,bo);
  input [3:0]inp1,inp2;
  input bin;
  output reg [3:0]sub;
  output reg bo;
  wire b1,b2,b3;
  fullsubtractor f0(.inp1(inp1[0]),.inp2(inp2[0]),.bin(bin),.sub(sub[0]),.bo(b1));
  fullsubtractor f1(.inp1(inp1[1]),.inp2(inp2[1]),.bin(b1),.sub(sub[1]),.bo(b2));
  fullsubtractor f2(.inp1(inp1[2]),.inp2(inp2[2]),.bin(b2),.sub(sub[2]),.bo(b3));
  fullsubtractor f3(.inp1(inp1[3]),.inp2(inp2[3]),.bin(b3),.sub(sub[3]),.bo(bo));
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//full subtractor
module fullsubtractor(inp1,inp2,bin,sub,bo);
  input inp1,inp2,bin;
  output reg sub,bo;
  wire b,b1,sub1;
  Half_Subtractor h1(.inp1(inp1),.inp2(inp2),.bo(b),.sub(sub1));
  Half_Subtractor h2(.inp1(sub1),.inp2(bin),.bo(b1),.sub(sub));
  or last(bo,b1,b);
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//half subtarctor
module Half_Subtractor(input inp1, inp2,output reg sub, bo);
assign sub = inp1 ^ inp2;
assign bo = ~inp1 
