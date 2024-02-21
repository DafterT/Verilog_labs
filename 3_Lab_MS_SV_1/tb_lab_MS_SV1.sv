`timescale 1ns / 1ns
module tb_lab_MS_SV1 ();
  bit CLK = 1'b0;
  bit rst_n;
  bit CAout, CBout;
  bit AeqB, AmB, BmA;
  bit CoutA, CoutB;
  bit cntA_EQ_cntB;
  bit [9:0] cntA_Module, cntB_Module;
  bit [9:0] cntA, cntB;

  lab_MS_SV1 u_lab_MS_SV1 (
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

  localparam PERIOD = 20;

  initial forever #(PERIOD / 2) CLK = ~CLK;


  initial begin
    rst_n = 1'd0;
    #(PERIOD * 4);
    rst_n = 1'd1;
    cntA_Module = 10'd10;
    cntB_Module = 10'd10;
    #(PERIOD * 28);

    rst_n = 1'd0;
    #(PERIOD * 4);
    rst_n = 1'd1;
    cntA_Module = 10'd5;
    cntB_Module = 10'd10;
    #(PERIOD * 28);

    rst_n = 1'd0;
    #(PERIOD * 4);
    rst_n = 1'd1;
    cntA_Module = 10'd10;
    cntB_Module = 10'd5;
    #(PERIOD * 28);

    rst_n = 1'd0;
    #(PERIOD * 4);
    rst_n = 1'd1;
    cntA_Module = 10'd5;
    cntB_Module = 10'd5;
    #(PERIOD * 28);
    $stop;
  end


endmodule
