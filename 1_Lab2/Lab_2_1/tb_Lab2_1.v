`timescale 1ns/100ps
module tb_Lab2_1();

reg tb_clk;
reg tb_reset;
wire [7:0] tb_led;

lab2_1 #(5) DUT (
	.LED (tb_led),
	.CLK (tb_clk),
	.RESET (tb_reset)
);

always #10 tb_clk = ~tb_clk;

initial begin
	tb_clk = 1'b0;
	tb_reset = 1'b1;
	
	#100 tb_reset = 0;
	#1000 $stop;
end

endmodule
