`timescale 1ns / 1ns
module tb_histogram_unit ();
  parameter SIZE = 5;
  parameter MAX_NUMBER = 127;
  bit [$clog2(MAX_NUMBER) - 1:0] d_in;
  bit                            CLK;
  bit                            ENA;
  bit                            RST;
  bit [              SIZE - 1:0] mem_out;

  localparam CLK_PERIOD = 20;

  initial forever #(CLK_PERIOD / 2) CLK = ~CLK;

  histogram_unit #(
    .SIZE      (SIZE),
    .MAX_NUMBER(MAX_NUMBER)
  ) histogram_unit_inst (
    .*
  );

  initial begin
    ENA = '1;
    for (int i = 0; i < (MAX_NUMBER + 1) * 8; i++) begin
      @(negedge CLK) d_in += 2;
    end
    @(negedge CLK)
    RST = '1;
    @(negedge CLK)
    $stop;
  end

endmodule