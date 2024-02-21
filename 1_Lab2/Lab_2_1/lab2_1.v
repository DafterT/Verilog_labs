module lab2_1
#(parameter div_by = 25)
(
	input CLK,
	input RESET,
	output [7:0] LED
);

wire [4:0] adr;
wire clk_en;
wire srst;

DFF_chain DFF_chain_inst (
	.clk	(CLK),
	.d		(RESET),
	.q		(srst)
);

cnt_div #(div_by) cnt_div_inst (
	.clk		(CLK),
	.reset	(RESET),
	.cout		(clk_en)
);

cnt_adr cnt_adr_inst (
	.clock	(CLK),
	.sclr		(RESET),
	.clk_en	(clk_en),
	.q			(adr)
);

ROM_8D ROM_8D_inst (
	.clock	(CLK),
	.address	(adr),
	.q			(LED)
);

endmodule
