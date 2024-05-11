`timescale 1 ns / 1 ns
module tb_integration_file ();
  localparam N = 32;
  localparam PERIOD = 20;
  bit [N - 1:0] coe_A;
  bit [N - 1:0] coe_B;
  bit           csi_clk;
  bit           rsi_srst;
  bit [N - 1:0] coe_R;

  integration_file #(N) u0 (.*);

  bit [N - 1:0] excepted_result;
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
      $fscanf(input_file, "%d", coe_A);
      $fscanf(input_file, "%d", coe_B);
      $fscanf(input_file, "%d", rsi_srst);
      $fscanf(answers_file, "%d", excepted_result);

      #(PERIOD * 2);
      if (excepted_result != coe_R) begin
        $display("Incorrect output:\nExcepted: %b\nActual: %b", excepted_result, coe_R);
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
