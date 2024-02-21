module cnt_10bits (
  input  bit       CLK,
  input  bit [9:0] Module,
  input  bit       rst_n,
  output bit       Cout,
  output bit [9:0] cnt
);

  always_ff @(posedge CLK, negedge rst_n)
    if (!rst_n) cnt <= 10'd0;
    else cnt <= cnt < (Module - 10'd1) ? cnt + 10'd1 : 10'd0;

  assign Cout = cnt == (Module - 10'd1);

endmodule
