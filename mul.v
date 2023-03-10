module full_adder #(parameter N=16)
  (
    input [N-1:0] a2,
    input [N-1:0] b2,
    output [N-1:0]sum22
);
  
  
  assign  sum2 = a2+b2;
  
endmodule

module MUL#(parameter N=16)( 
  input [N-1:0] a2,
  input [N-1:0] b2,
  output [2*N-1:0] sum
);
  
  wire [N][  N-1:0] temp1;// [N];
  wire [N][2*N-1:0] temp2;// [N];
  
  wire [N][2*N-1:0] temp3;// [N];
  
  //always_comb begin
  assign	temp1[0] = b2[0] ? a2 : 0;//& {N{B[0]}};
  assign	temp2[0] = temp1[0] << 0;
  assign	temp3[0] = temp2[0];
  //end
  
  genvar i;
  
  generate
    for(i=1; i<=N-1; i++)begin
      assign temp1[i] = b2[i] ? a2 : 0;
      assign temp2[i] = temp1[i] << i;
      full_adder#(2*N) fa(
        .a2(temp3[i-1]),
        .b2(temp2[i]),
        .sum(temp3[i])
      );
    end
  endgenerate

  assign O = temp3[N-1];
  
endmodule
