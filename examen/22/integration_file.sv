`timescale 1 ns / 1 ns
module integration_file #(
  parameter N = 32
) (
  // Avalon_MM
  input  bit [    7:0] avs_s0_address,
  input  bit           avs_s0_write,
  input  bit [N - 1:0] avs_s0_writedata,
  input  bit           avs_s0_read,
  // TODO: Мб тут трабл в переполнении, нужно спросить учитывать ли это
  output bit [N - 1:0] avs_s0_readdata,
  // clk, rst
  input  bit           csi_clk,
  input  bit           rsi_srst
);

  bit [N - 1:0] data_A = '0;

  always_ff @(posedge csi_clk) begin

    if (rsi_srst) begin
      data_A          <= '0;
      avs_s0_readdata <= '0;
    end else begin
      if (avs_s0_write)
        case (avs_s0_address)
          1'b0: data_A <= avs_s0_writedata;
        endcase
      if (avs_s0_read)
        case (avs_s0_address)
          1'b0: avs_s0_readdata <= (data_A << 2) - data_A;  // 4 = 100
        endcase
      else avs_s0_readdata <= '0;
    end
  end

endmodule
