`timescale 1ns / 1ns
module tb_Lab3_1 ();
  reg        tb_clk;
  reg  [5:0] tb_mem   [0:127];
  reg        tb_dir;
  wire [3:0] tb_dig;
  wire [6:0] tb_hex;
  reg        tb_reset;
  wire [6:0] tb_ss;

  localparam CLK_PERIOD = 20;

  initial begin : clock_gen
    tb_clk = 1'b0;
    forever #(CLK_PERIOD / 2) tb_clk = ~tb_clk;
  end

  Lab3_1 #(25'd4) Lab3_1_inst (
    .CLK(tb_clk),
    .RST(tb_reset),
    .DIR(tb_dir),
    .DIG(tb_dig),
    .HEX(tb_hex)
  );

  initial begin : reset_gen
    tb_reset = 1'b0;
    #(CLK_PERIOD * 5) tb_reset = 1'b1;
  end

  initial begin : control_gen
    tb_dir = 1'b0;
    #(CLK_PERIOD * 55) tb_dir = 1'b1;
    #(CLK_PERIOD * 44);
  end

  initial begin : mem_reading
    $readmemb("ss_to_ascii.txt", tb_mem);
    #(CLK_PERIOD * 111) $stop;
  end

  assign tb_ss = tb_mem[tb_hex];

endmodule

