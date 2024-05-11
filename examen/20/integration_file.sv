`timescale 1 ns / 1 ns
module integration_file #(
  parameter N = 32
) (
  // Avalon_MM
  input  bit [    7:0] avs_s0_address,    // avs_s0.address
  input  bit           avs_s0_write,      //       .write
  input  bit [N - 1:0] avs_s0_writedata,  //       .writedata
  // clk, rst
  input  bit           csi_clk,           //  clock.clk
  input  bit           rsi_srst,          //  reset.reset
  // Conduit
  // TODO: Мб тут трабл в переполнении, нужно спросить учитывать ли это
  output bit [N - 1:0] coe_R
);

  bit [N - 1:0] data_A = '0, data_B = '0;

  always_ff @(posedge csi_clk) begin
    coe_R <= ((data_A << 1) + data_A) - ((data_B << 3) + data_B); // 9 = 1001, 3 = 11
    if (rsi_srst) begin
      data_A <= '0;
      data_B <= '0;
    end else if (avs_s0_write) begin
      case (avs_s0_address)
        1'b0: data_A <= avs_s0_writedata;
        1'b1: data_B <= avs_s0_writedata;
      endcase
    end
  end

endmodule
