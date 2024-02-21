`timescale 1ns / 1ns
module tb_lab2_3;
  parameter PERIOD = 10;
  reg        CLK = 0;
  reg        aRSTin = 0;
  reg  [7:0] Din = 0;
  wire       PWM;


  initial begin
    forever #(PERIOD / 2) CLK = ~CLK;
  end

  lab2_3 u_lab2_3 (
    .CLK   (CLK),
    .aRSTin(aRSTin),
    .Din   (Din[7:0]),
    .PWM(PWM)
  );

  initial begin
	 Din = 8'd64;
	 #(PERIOD * (256 + 128));
	 Din = 8'd200;
	 #(PERIOD * (256 + 128 + 10));
    $stop;
  end

endmodule
