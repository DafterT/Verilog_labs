`timescale 1 ns / 1 ns
module impl (
  // clk, rst
  input  bit        csi_clk,        //  clock.clk
  input  bit        rsi_reset,      //  reset.reset
  // in_A ST
  input  bit [ 7:0] asi_in0_data,   //  asi_in0.data
  output bit        asi_in0_ready,  //         .ready
  input  bit        asi_in0_valid,  //         .valid
  // in_B ST
  input  bit [ 7:0] asi_in1_data,   //  asi_in1.data
  output bit        asi_in1_ready,  //         .ready
  input  bit        asi_in1_valid,  //         .valid
  // in_C ST
  input  bit [ 7:0] asi_in2_data,   //  asi_in2.data
  output bit        asi_in2_ready,  //         .ready
  input  bit        asi_in2_valid,  //         .valid
  // out_cond
  output bit [16:0] coe_R
);

  assign asi_in0_ready = 1;
  assign asi_in1_ready = 1;
  assign asi_in2_ready = 1;

  bit [7:0] A, B, C;

  always_ff @(posedge csi_clk, posedge rsi_reset) begin
    if (rsi_reset) begin
      A     <= 0;
      B     <= 0;
      C     <= 0;
      coe_R <= 0;
    end else begin
      if (asi_in0_valid) A <= asi_in0_data;
      if (asi_in1_valid) B <= asi_in1_data;
      if (asi_in2_valid) C <= asi_in2_data;
      coe_R <= (A + B) * C;
    end
  end

endmodule
