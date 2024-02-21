module cnt_div
#(parameter div = 25)
(
	input clk,
	input reset,
	output reg cout
);

reg [31:0] cnt;
wire cycle;

always @(posedge clk)
	if (reset | cycle)
		cnt <= 0;
	else
		cnt <= cnt + 1;

assign cycle = (cnt == (div - 1));

always @(posedge clk)
	if (reset)
		cout <= 1'b0;
	else
		if (cycle)
			cout <= 1'b1;
		else
			cout <= 1'b0;

endmodule
