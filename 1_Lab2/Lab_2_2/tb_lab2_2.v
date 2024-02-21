`timescale 1ns / 1ns
module tb_lab2_2;

  parameter PERIOD = 10;
  reg         CLK = 0;
  reg         aRSTin = 0;
  wire [15:0] Dout;


  initial begin
    forever #(PERIOD / 2) CLK = ~CLK;
  end

  lab2_2 lab2_2_inst (
    .CLK   (CLK),
    .aRSTin(aRSTin),
    .Dout  (Dout[15:0])
  );

  initial begin
    #(PERIOD * 256 * 2);
    $stop;
  end

endmodule
