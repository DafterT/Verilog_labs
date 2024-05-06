module lab_5 (
  input  bit       clk,
  input  bit       pbb,
  output bit [7:0] led
);

  Lab5_nios u0 (
    .clk_clk      (clk),  //   clk.clk
    .led_export   (led),  //   led.export
    .reset_reset_n(pbb)   // reset.reset_n
  );

endmodule
