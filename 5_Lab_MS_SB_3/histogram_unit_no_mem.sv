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
  bit [SIZE - 1:0] mem_arr[0:MAX_NUMBER];

  bit [SIZE - 1:0] mem_in;
  bit [$clog2(MAX_NUMBER) - 1:0] adr_in, adr_clear;

  initial for (int i = 0; i <= MAX_NUMBER; i++) mem_arr[i] = 0;

  assign mem_in = RST ? '0 : (ENA ? mem_arr[adr_in] + 1'b1 : mem_arr[adr_in]);
  assign adr_in = RST ? adr_clear : d_in;

  always @(posedge CLK) begin : building_histogram
    mem_arr[adr_in] <= mem_in;
    mem_out         <= mem_arr[adr_in];
  end

  always_ff @(posedge CLK, negedge RST) begin : clearing_array
    if (~RST) adr_clear <= '0;
    else adr_clear <= adr_clear + 1'b1;
  end

endmodule
