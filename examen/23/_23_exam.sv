`timescale 1ns / 1ns
module _23_exam (
  input  bit        clk,
  input  bit        rst_in,
  output bit [31:0] out0_data,
  input  bit        out0_ready,
  input  bit        out0_valid,
  input  bit [31:0] in1_data,
  output bit        in1_ready,
  input  bit        in1_valid,
  input  bit [31:0] in0_data,
  output bit        in0_ready,
  input  bit        in0_valid
);

  exam u0 (
    .clk_clk      (clk),
    .reset_reset_n(rst[1]),
    .out0_data    (out0_data),
    .out0_ready   (out0_ready),
    .out0_valid   (out0_valid),
    .in1_data     (in1_data),
    .in1_ready    (in1_ready),
    .in1_valid    (in1_valid),
    .in0_data     (in0_data),
    .in0_ready    (in0_ready),
    .in0_valid    (in0_valid)
  );

  bit [1:0] rst = '0;

  always_ff @(posedge clk) begin
    rst[1:0] <= {rst[0], rst_in};
  end

endmodule
