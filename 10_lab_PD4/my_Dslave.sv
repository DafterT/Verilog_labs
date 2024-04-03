`timescale 1ns/1ns
module my_Dslave(
	input bit        csi_clk, rsi_reset,
	input bit [7:0]  avs_s0_writedata,
	input bit        avs_s0_write,
	output bit       avs_s0_waitrequest,
	output bit [7:0] coe_s0_Dout
);

bit [7:0] cnt_;
assign avs_s0_waitrequest = 1'b0;
always_ff @(posedge csi_clk)
	if (rsi_reset)   	     	cnt_ <= 8'd0;
	else if (avs_s0_write)	cnt_ <= cnt_ + 8'd1;
assign coe_s0_Dout = cnt_;
endmodule
