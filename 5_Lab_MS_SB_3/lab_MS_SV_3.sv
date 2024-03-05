`timescale 1ns / 1ns
module lab_MS_SV_3 (
  input  bit       CLK,
  input  bit       RST,
  input  bit       ENA,
  output bit [6:0] mem_out
);

  bit [6:0] LFSR_out;
  bit [6:0] d_in;

  assign d_in = LFSR_out;

  LFSR_7_6_3_1_0_F LFSR_7_6_3_1_0_F_inst (
    .CLK,
    .RST,
    .ENA,
    .LFSR_out
  );

  histogram_unit histogram_unit_inst (
    .CLK,
    .d_in,
    .RST,
    .ENA,
    .mem_out
  );

endmodule
