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

  integration_file #(N) u0 (.*);

  int input_file, char_1;

  initial begin
    `define eof 32'hffff_ffff
    input_file = $fopen("input_file.txt", "r");
    char_1     = $fgetc(input_file);
    while (char_1 != `eof) begin
      $ungetc(char_1, input_file);
      $fscanf(input_file, "%b", asi_in0_data);
      $fscanf(input_file, "%b", asi_in0_valid);
      $fscanf(input_file, "%b", asi_in1_data);
      $fscanf(input_file, "%b", asi_in1_valid);
      $fscanf(input_file, "%b", aso_out0_ready);
      $fscanf(input_file, "%b", reset_reset);
      #(PERIOD * 2);
      char_1 = $fgetc(input_file);
    end
    $fclose(input_file);
    $stop;
  end

endmodule
