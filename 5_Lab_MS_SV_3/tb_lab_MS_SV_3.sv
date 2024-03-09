`timescale 1ns / 1ns
module tb_lab_MS_SV_3 ();
  bit       CLK;
  bit       RST;
  bit       ENA;
  bit [6:0] mem_out;

  lab_MS_SV_3 lab_MS_SV_3_unit (.*);

  localparam CLK_PERIOD = 20;

  initial forever #(CLK_PERIOD / 2) CLK = ~CLK;

  initial begin
    RST = '1;
    ENA = '1;
    #(CLK_PERIOD / 2);
    RST = '0;
    repeat(127 * 5) @(negedge CLK);
    $stop;
  end

endmodule
