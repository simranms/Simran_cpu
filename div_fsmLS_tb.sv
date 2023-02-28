module top;
parameter N=16;

  reg[N-1:0] rs1_reg;
   reg[N-1:0] rs2_reg;
reg bin,clk,rst;
wire[N-1:0] div_rd,rem;
wire done;
  div#(N) div_dut(.clk(clk),.reset(rst),.rs1_reg(rs1_reg),.rs2_reg(rs2_reg),.bin(bin),.div_rd(div_rd),.rem(rem),.done(done));

initial begin
	clk=0;
	forever #5 clk=~clk;

end
initial begin
	bin=0;
   repeat(1)begin
     rs1_reg=2000;
     rs2_reg=500;
     #5;
   end
   
 end
 initial begin
	rst=1;
	#10 rst=0;
end
initial begin
	#1000;
	$finish;
 end

 initial begin
	
   $monitor("%t rs1=%d, rs2=%d rd=%d, rem = %0d",$time,rs1_reg,rs2_reg,div_rd,rem);
	 $dumpfile("div.vcd");
	 $dumpvars(1);
 end
 endmodule


