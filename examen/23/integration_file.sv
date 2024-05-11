`timescale 1 ns / 1 ns
module integration_file #(
  parameter N = 32
) (
  // clk, rst
  input  bit         clock_clk,       //  clock.clk
  input  bit         reset_reset,     //  reset.reset
  // in_A ST
  input  bit [N-1:0] asi_in0_data,    //  asi_in0.data
  output bit         asi_in0_ready,   //         .ready
  input  bit         asi_in0_valid,   //         .valid
  // in_B ST
  input  bit [N-1:0] asi_in1_data,    //  asi_in0.data
  output bit         asi_in1_ready,   //         .ready
  input  bit         asi_in1_valid,   //         .valid
  // out_R ST
  output bit [N-1:0] aso_out0_data,   // aso_out0.data
  input  bit         aso_out0_ready,  //         .ready
  output bit         aso_out0_valid   //         .valid
);

  assign asi_in0_ready = 1'b1;
  assign asi_in1_ready = 1'b1;

  bit [N-1:0] A = '0, B = '0;

  always_ff @(posedge clock_clk) begin
    if (reset_reset) begin
      A <= '0;
      B <= '0;
    end else begin
      if (asi_in0_valid) A <= asi_in0_data;
      if (asi_in1_valid) B <= asi_in1_data;
    end
  end

  always_ff @(posedge clock_clk) begin
    if (reset_reset) begin
      aso_out0_data  <= '0;
      aso_out0_valid <= '0;
    end else if (aso_out0_ready) begin
      aso_out0_data  <= A | B;
      aso_out0_valid <= '1;
    end
  end

endmodule
