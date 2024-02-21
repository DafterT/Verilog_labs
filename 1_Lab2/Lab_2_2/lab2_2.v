module lab2_2 (
  input             CLK,
  input             aRSTin,
  output reg [15:0] Dout
);

  // DFF
  reg t_rst = 1'b1, arst = 1'b1;

  always @(posedge CLK or posedge aRSTin)
    if (aRSTin) begin
      t_rst <= 1'b1;
      arst  <= 1'b1;
    end else begin
      t_rst <= 1'b0;
      arst  <= t_rst;
    end

  // CNT
  wire [7:0] Dcnt;

  cnt cnt_inst (
    .aclr (arst),
    .clock(CLK),
    .q    (Dcnt)
  );

  // PWR
  wire [15:0] Dpwr;

  pwr pwr_inst (
    .dataa (Dcnt),
    .datab (Dcnt),
    .result(Dpwr)
  );

  // RG
  always @(posedge CLK or posedge arst)
    if (arst) Dout <= 1'b0;
    else Dout <= Dpwr;

endmodule
