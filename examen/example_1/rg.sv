`timescale 1ns / 1ns
module rg 
(
  interface_reg bus
);

  always_ff @(posedge bus.clk) begin
    bus._a <= bus.a;
    bus._b <= bus.b;
    bus._c <= bus.c;
  end

endmodule
