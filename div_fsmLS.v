module div #(parameter N=16) (
  input clk,
  input reset,bin,
  input unsigned [N-1:0]rs1_reg,
  input unsigned [N-1:0] rs2_reg,
  output reg [N-1:0] div_rd,
  output reg [N-1:0] rem,
    output reg done
);
  //wire [15:0] quotient;
  //wire [15:0] remainder;
// Define states for the FSM
    reg [N-1:0] divisor,dividend,count,result,temp,d;
typedef enum logic [2:0] {
    INIT,
    COMP_OP,
    SUBTRACT,
    TEMP_OP,
    OUTPUT
} fsm_state_t;

// Define signals for the FSM
  reg signed [15:0] current_dividend;
  reg signed [15:0] current_quotient;
reg [2:0] state;
 


// Initialize the signals and state
/*initial begin
    current_dividend =rs1_reg;
    current_quotient = 0;
    state = INIT;
end
*/
always @(posedge clk) begin
    if (reset) begin
        dividend <=rs1_reg;
        divisor <=rs2_reg;
        div_rd <= 0;
        state <= INIT;
	count<=0;
	rem<=0;
	result<=0;
	temp<=0;
	d<=rs1_reg;
        done <= 0;
      $monitor("%t rs1=%d, rs2=%d rd=%d, rem = %0d",$time,rs1_reg,rs2_reg,div_rd,rem);
    end
    else begin
        case (state)
            INIT: begin
		    state<=COMP_OP;
            end
            COMP_OP: begin
              #1;
              if(dividend >= divisor)begin
                d<=dividend;
              #1;
                dividend <= dividend >> 1;
			#1;
			count<=count+1;
              #1;
                state<=COMP_OP;
                $monitor("%t rs1=%d, rs2=%d rd=%d, rem = %0d",$time,rs1_reg,rs2_reg,div_rd,rem);
            	end
            //end
		    else begin
			    state<=SUBTRACT;
            end
            end
            SUBTRACT: begin
              temp <= d-divisor;
			#1;
		    state <= TEMP_OP;
            end
	    TEMP_OP: begin
          if(temp>=rs1_reg)begin
			    temp<=temp-rs1_reg;
			#1;
			    result<=result+1;
              #1;
			    state <= TEMP_OP;
		    end
		    else
			    state <= OUTPUT;
	    end
            OUTPUT: begin
                // Output the quotient and remainder
              div_rd<=(2**(count-1))+result;
			#5;
                rem<= temp;
                done <= 1;
                // Move back to the INIT state
                //state <= default;
            end
            default: begin
                state <= INIT;
            end
        endcase
      $monitor("%t rs1=%d, rs2=%d rd=%d, rem = %0d",$time,rs1_reg,rs2_reg,div_rd,rem);
    end
end

endmodule
