`timescale 1 ns / 1 ns
module tb_my_module ();
  localparam PERIOD = 20;
  // clk, rst
  bit        csi_clk;  //  clock.clk
  bit        rsi_reset;  //  reset.reset
  // in_A ST
  bit [ 7:0] asi_in0_data;  //  asi_in0.data
  bit        asi_in0_ready;  //         .ready
  bit        asi_in0_valid;  //         .valid
  // in_B ST
  bit [ 7:0] asi_in1_data;  //  asi_in1.data
  bit        asi_in1_ready;  //         .ready
  bit        asi_in1_valid;  //         .valid
  // in_C ST
  bit [ 7:0] asi_in2_data;  //  asi_in2.data
  bit        asi_in2_ready;  //         .ready
  bit        asi_in2_valid;  //         .valid
  // out_R ST
  bit [15:0] aso_out0_data;  //  asi_in2.data
  bit        aso_out0_ready;  //         .ready
  bit        aso_out0_valid;  //         .valid

  my_module u0 (.*);

  bit [16:0] excepted_result;
  int input_file, answers_file, char_1, char_2;

  initial begin
    forever #(PERIOD / 2) csi_clk = ~csi_clk;
  end

  initial begin
    `define eof 32'hffff_ffff
    input_file   = $fopen("input_file.txt", "r");
    answers_file = $fopen("except_output.txt", "r");
    char_1       = $fgetc(input_file);
    char_2       = $fgetc(answers_file);
    while (char_1 != `eof && char_2 != `eof) begin
      $ungetc(char_1, input_file);
      $ungetc(char_2, answers_file);
      $fscanf(input_file, "%d", asi_in0_data);
      $fscanf(input_file, "%d", asi_in0_valid);
      $fscanf(input_file, "%d", asi_in1_data);
      $fscanf(input_file, "%d", asi_in1_valid);
      $fscanf(input_file, "%d", asi_in2_data);
      $fscanf(input_file, "%d", asi_in2_valid);
      $fscanf(input_file, "%d", aso_out0_ready);
      $fscanf(input_file, "%d", rsi_reset);
      $fscanf(answers_file, "%d", excepted_result);

      #(PERIOD * 2);
      if (
        excepted_result != aso_out0_data && 
        asi_in0_ready == 1 && 
        asi_in1_ready == 1 && 
        asi_in2_ready == 1
      ) begin
        $display("Incorrect output:\nExcepted: %b\nActual: %b", excepted_result, aso_out0_data);
        $display("r1: %b\nr2: %b\nr3: %b", asi_in0_ready, asi_in1_ready, asi_in2_ready);
        $stop;
      end
      char_1 = $fgetc(input_file);
      char_2 = $fgetc(answers_file);
    end
    $display("All test have been passed!");
    $fclose(input_file);
    $fclose(answers_file);
    $stop;
  end

endmodule
