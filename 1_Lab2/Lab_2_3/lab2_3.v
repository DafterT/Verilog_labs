module lab2_3 (
  input            CLK,
  input            aRSTin,
  input      [7:0] Din,
  output reg       PWM
);

  // DFF_arst
  reg t_rst = 1'b1, arst = 1'b1;

  always @(posedge CLK or posedge aRSTin)
    if (aRSTin) begin
      t_rst <= 1'b1;
      arst  <= 1'b1;
    end else begin
      t_rst <= 1'b0;
      arst  <= t_rst;
    end

  // RG
  reg [7:0] Dint = 8'd128;
  wire      t_cout;

  always @(posedge CLK or posedge arst)
    if (arst) Dint <= 8'd129;
    else if (t_cout) Dint <= Din;

  // CNT
  wire [7:0] Dcnt;

  cnt cnt_inst (
    .aclr (arst),
    .clock(CLK),
    .cout (t_cout),
    .q    (Dcnt)
  );

  // CMP
  wire t_pwm;

  cmp cmp_inst (
    .dataa(Dint),
    .datab(Dcnt),
    .alb  (t_pwm)
  );

  // DFF_out
  always @(posedge CLK or posedge arst)
    if (arst) PWM <= 1'b1;
    else PWM <= t_pwm;

endmodule
