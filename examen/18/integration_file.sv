`timescale 1 ns / 1 ns
module integration_file #(
  parameter N = 32
) (
  // Avalon_MM
  input  reg [    7:0] avs_s0_address,    // avs_s0.address
  input  reg           avs_s0_write,      //       .write
  input  reg [N - 1:0] avs_s0_writedata,  //       .writedata
  // clk, rst
  input  reg           clk,               //  clock.clk
  input  reg           srst,              //  reset.reset
  // Conduit
  output reg [N - 1:0] R
);

  reg [N - 1:0] data_A = '0, data_B = '0;

  always_ff @(posedge clk) begin
    R <= data_A * data_B * 2;
    if (srst) begin
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
