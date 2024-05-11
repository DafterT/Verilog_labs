`timescale 1ns / 1ns
module _19_exam (
  input  bit        clk,
  input  bit        rst_in,
  input  bit [ 7:0] address,
  input  bit        write,
  input  bit [31:0] writedata,
  output bit [31:0] R
);

  exam u0 (
    .clk_clk      (clk),     
    .reset_reset_n(rst[1]),   
    .s0_address   (address),  
    .s0_write     (write),      
    .s0_writedata (writedata),
    .r_export     (R)          
  );

  bit [1:0] rst = '0;

  always_ff @(posedge clk) begin
    rst[1:0] <= {rst[0], rst_in};
  end

endmodule
