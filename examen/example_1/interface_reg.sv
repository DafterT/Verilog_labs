interface interface_reg #(
  parameter W = 8
) (
  input  bit clk,
  input  bit [W - 1:0] a, b, c,
  output bit [W - 1:0] _a, _b, _c
);

endinterface
