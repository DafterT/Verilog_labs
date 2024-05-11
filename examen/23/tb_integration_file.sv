`timescale 1ns / 1ns
module tb_integration_file;

  parameter PERIOD = 10;
  parameter N = 32;

  // clk, rst
  bit         clock_clk;
  bit         reset_reset;
  // in_A ST
  bit [N-1:0] asi_in0_data;
  bit         asi_in0_ready;
  bit         asi_in0_valid;
  // in_B ST
  bit [N-1:0] asi_in1_data;
  bit         asi_in1_ready;
  bit         asi_in1_valid;
  // out_R ST
  bit [N-1:0] aso_out0_data;
  bit         aso_out0_ready;
  bit         aso_out0_valid;

  initial begin
    forever #(PERIOD / 2) clock_clk = ~clock_clk;
  end

  integration_file #(N) u_integration_file (.*);

  // TODO: Можно добавить больше тестовых ситуаций, типо на максимальном значении и тп.
  initial begin
    reset_reset    <= 1'b0;
    asi_in0_data   <= 32'b101110;
    asi_in0_valid  <= 1'b1;
    asi_in1_data   <= 32'b001010;
    asi_in1_valid  <= 1'b1;
    aso_out0_ready <= 1'b1;
    #PERIOD;
    asi_in0_data <= 32'b11111000011;
    asi_in1_data <= 32'b00011110010;
    #(PERIOD * 2);
    reset_reset <= 1'b1;
    #(PERIOD * 2);
    $stop;
  end

endmodule
