module DFF_chain (
	input clk,
	input d,
	output reg q
);

reg d_int;
always @(posedge clk) begin
	d_int <= d;
	q <= d_int;
end

endmodule
