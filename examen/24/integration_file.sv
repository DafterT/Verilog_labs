`timescale 1 ns / 1 ns
module integration_file #(
  parameter N = 32
) (
  // Avalon_MM
  input  bit [N - 1:0] coe_A,
  input  bit [N - 1:0] coe_B,
  // clk, rst
  input  bit           csi_clk,   //  clock.clk
  input  bit           rsi_srst,  //  reset.reset
  // Conduit
  // TODO: Мб тут трабл в переполнении, нужно спросить учитывать ли это
  output bit [N - 1:0] coe_R
);

  bit [N - 1:0] data_A = '0, data_B = '0;

  always_ff @(posedge csi_clk) begin
    if (rsi_srst) begin
      data_A <= '0;
      data_B <= '0;
      coe_R  <= '0;
    end else begin
      data_A <= coe_A;
      data_B <= coe_B;
      coe_R  <= (data_A + data_B) * (data_A - data_B);
    end
  end

endmodule
