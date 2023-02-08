module addr(input [2:0]a1,
            input [2:0]b1,
            input c1_input,
            output reg c1_output,
            output reg [3:0]sum1);
  always@(a1 or b1 or c1_input) begin
              {c1_output, sum1}=a1+b1+c1_input;
  end
endmodule
