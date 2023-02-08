module subr(input [2:0]c1,
            input [2:0]d1,
            input i1_input,
            output reg o1_output,
            output reg [3:0]sum3);
  always@(c1 or d1 or i1_input) begin
    {o1_output, sum3}=c1-(d1)-(i1_input);
  end
endmodule
