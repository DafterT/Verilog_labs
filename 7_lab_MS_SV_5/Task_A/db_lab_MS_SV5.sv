module db_lab_MS_SV5 (
  (* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "R8" *)
  input bit CLK
);

  bit       reset;
  bit [7:0] D_even;
  bit [7:0] D_odd;
  lab_MS_SV5 UUT (.*);
  SP_unit SU_ (
    .source    (reset),
    .source_clk(CLK)
  );

endmodule
