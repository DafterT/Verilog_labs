module lab_MS_SV1 (
  input  bit       CLK,
  input  bit [9:0] cntA_Module,
  input  bit [9:0] cntB_Module,
  input  bit       rst_n,
  output bit       CoutA,
  output bit       CoutB,
  output bit [9:0] cntA,
  output bit [9:0] cntB,
  output bit       cntA_EQ_cntB,
  output bit       AeqB,
  output bit       AmB,
  output bit       BmA
);

  cnt_10bits U_cntA (
    .CLK   (CLK),
    .Module(cntA_Module),
    .rst_n (rst_n),
    .Cout  (CoutA),
    .cnt   (cntA)
  );
  cnt_10bits U_cntB (
    .CLK   (CLK),
    .Module(cntB_Module),
    .rst_n (rst_n),
    .Cout  (CoutB),
    .cnt   (cntB)
  );
  cmp_eq U_EQ (
    .A (cntA),
    .B (cntB),
    .EQ(cntA_EQ_cntB)
  );
  fsm U_fsm (
    .CLK  (CLK),
    .rst_n(rst_n),
    .inA  (CoutA),
    .inB  (CoutB),
    .AeqB (AeqB),
    .AmB  (AmB),
    .BmA  (BmA)
  );

endmodule
