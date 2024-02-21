module db_lab_MS_SV1 (
  (* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "23" *)
  input CLK
);

  bit rst_n;
  bit AeqB, AmB, BmA;
  bit CoutA, CoutB;
  bit cntA_EQ_cntB;
  bit [9:0] cntA_Module, cntB_Module;
  bit [9:0] cntA, cntB;

  lab_MS_SV1 U1 (
    .CLK         (CLK),
    .cntA_Module (cntA_Module),
    .cntB_Module (cntB_Module),
    .rst_n       (rst_n),
    .CoutA       (CoutA),
    .CoutB       (CoutB),
    .cntA        (cntA),
    .cntB        (cntB),
    .cntA_EQ_cntB(cntA_EQ_cntB),
    .AeqB        (AeqB),
    .AmB         (AmB),
    .BmA         (BmA)
  );

  SP_unit U2 (
    .source    ({rst_n, cntA_Module, cntB_Module}),
    .source_clk(CLK)
  );

endmodule
