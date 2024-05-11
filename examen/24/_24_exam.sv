`timescale 1ns / 1ns
module _24_exam (
  input  bit        clk,
  input  bit        rst_in,
  input  bit [31:0] a,
  input  bit [31:0] b,
  output bit [31:0] r
);

  exam u0 (
    .clk_clk      (clk),     //   clk.clk
    .reset_reset_n(rst[1]),  // reset.reset_n
    .r_export     (r),       //     r.export
    .b_export     (b),       //     b.export
    .a_export     (a)        //     a.export
  );

  bit [1:0] rst = '0;

  always_ff @(posedge clk) begin
    rst[1:0] <= {rst[0], rst_in};
  end

endmodule
