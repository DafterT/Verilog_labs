`timescale 1ns / 1ns
module _22_exam (
  input  bit        clk,
  input  bit        rst_in,
  input  bit [ 7:0] address,
  input  bit        write,
  input  bit [31:0] writedata,
  input  bit        read,
  output bit [31:0] readdata
);

  exam u0 (
    .clk_clk      (clk),        //   clk.clk
    .reset_reset_n(rst[1]),     //   reset.reset_n
    .s0_address   (address),    //   s0.address
    .s0_write     (write),      //   .write
    .s0_writedata (writedata),  //   .writedata
    .s0_read      (read),       //   .read
    .s0_readdata  (readdata)    //   .readdata
  );

  bit [1:0] rst = '0;

  always_ff @(posedge clk) begin
    rst[1:0] <= {rst[0], rst_in};
  end

endmodule
