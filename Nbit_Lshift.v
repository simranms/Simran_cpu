module Lshift#(parameter N=16)(
  input [N-1:0] i,
  output [N-1:0] o
);
  //j=$size(divisor);
  assign o[0] = 1'b0;
  
  assign o[N-1:1] = i[N-2:0];
  
endmodule
module nbitshift#(parameter N=16)(
  input [N-1:0] D,
  input [N-1:0] d,
  output [N-1:0][N-1:0] o
);
  
  genvar i;
  bit [N-1:0]temp2[N];
  bit [N-1:0]temp3[N];
  
  assign temp3[0]=D;
  //assign temp2[0]=d[0]?D:0;
  assign o[0]=temp3[0];
  generate 
    for(i=1;i<N;i++)begin
      
      Lshift L(
        .i(temp3[i-1]),
        .o(temp3[i])
  );
      
     // assign temp2[i]=d[i]?temp3[i]:0;
      assign o[i]=temp3[i];
      
    end
  endgenerate
  
endmodule
      
