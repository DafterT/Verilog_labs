`timescale 1ns / 1ns
module tb_integration_file;

  parameter PERIOD = 10;
  parameter N = 32;

  bit [    7:0] avs_s0_address = 0;
  bit           avs_s0_write = 0;
  bit [N - 1:0] avs_s0_writedata = 0;
  bit           csi_clk = 0;
  bit           rsi_srst = 0;
  bit [N - 1:0] coe_R;

  initial begin
    forever #(PERIOD / 2) csi_clk = ~csi_clk;
  end

  integration_file #(N) u_integration_file (.*);

  // TODO: Можно добавить больше тестовых ситуаций, типо на максимальном значении и тп.
  initial begin
    rsi_srst         <= 1'b0;
    avs_s0_address   <= 8'd0;
    avs_s0_write     <= 1'b1;
    avs_s0_writedata <= 32'd55;
    #PERIOD;
    avs_s0_address   <= 8'd1;
    avs_s0_write     <= 1'b0;
    avs_s0_writedata <= 32'd22;
    #PERIOD;
    avs_s0_write <= 1'b1;
    #PERIOD;
    rsi_srst <= 1'b1;
    #(PERIOD * 2);
    $stop;
  end

endmodule
