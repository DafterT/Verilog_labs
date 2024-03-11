import lab_MS_SV4_pack::*;

module db_lab_MS_SV4 (
  (* altera_attribute = "-name IO_STANDARD \"3.3-v LVCMOS\"", chip_pin = "23" *)
  input CLK
);

  INST_t INST;
  data_y ALU_out;

  lab_MS_SV4 DUT (
    .ALU_out,
    .INST
  );

  SP_unit SP_ (
    .source    (INST),
    .probe     (ALU_out),
    .source_clk(CLK)
  );
endmodule
