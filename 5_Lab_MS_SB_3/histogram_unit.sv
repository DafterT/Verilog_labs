`timescale 1ns / 1ns
module histogram_unit #(
  parameter MAX_NUMBER = ((1 << 7) - 1),
  parameter SIZE       = 7
) (
  input  bit                            CLK,
  input  bit [$clog2(MAX_NUMBER) - 1:0] d_in,
  input  bit                            RST,
  input  bit                            ENA,
  output bit [              SIZE - 1:0] mem_out
);

  bit [SIZE - 1:0] mem_in;
  bit [$clog2(MAX_NUMBER) - 1:0] adr_in, adr_clear;

  bit clk_50;

  RAM RAM_inst (
    .address (adr_in),
    .data    (mem_in),
    .inclock (clk_50),
	 .outclock (clk_50),
    .wren    (ENA),
    .q       (mem_out)
  );
  

  PLL PLL_inst (
    .inclk0(CLK),
    .c0    (clk_50)
  );

  bit [$clog2(MAX_NUMBER) - 1:0] d_in_in [1:0];
  
  
  always_ff @(posedge clk_50) begin
	d_in_in[0] <= d_in;
	d_in_in[1] <= d_in_in[0];
	if (RST)
		mem_in <= '0;
	else if (d_in_in[0] == d_in_in[1])
		mem_in <= (ENA ? mem_out + 1'b1 : mem_out);
	else
		mem_in <= mem_out;
  end
  
  assign adr_in = RST ? adr_clear : d_in_in[0];

  always_ff @(posedge clk_50) begin : clearing_array
    if (~RST) adr_clear <= '0;
    else adr_clear <= adr_clear + 1'b1;
  end

endmodule
