`timescale 1 ns / 10 ps

module lab1_tb;

  localparam w = 8;
  localparam cw = 8;

  bit clk = 0;

  bit [w-1:0] da, db, op1, dc, dd, op2, de, df, op3, Ra, Rb, Rc;

  interface_exam #(w) lab_intr (
    da,
    db,
    op1,
    dc,
    dd,
    op2,
    de,
    df,
    op3,
    Ra,
    Rb,
    Rc
  );

  exam #(w, cw) tab1 (
    clk,
    lab_intr
  );

  localparam PERIOD = 5;

  initial begin
   forever #PERIOD clk = ~clk;
  end 

  initial begin
    da  = 8'b1;
    db  = 8'b11;
    op1 = 8'b1;
    dc  = 8'b111;
    dd  = 8'b1;
    op2 = 8'b0;
    de  = 8'b1111;
    df  = 8'b11111;
    op3 = 8'b1;
    #(PERIOD * 8);

    da  = 8'b0;
    db  = 8'b10;
    op1 = 8'b1;
    dc  = 8'b101;
    dd  = 8'b1;
    op2 = 8'b0;
    de  = 8'b1001;
    df  = 8'b10111;
    op3 = 8'b1;
    #(PERIOD * 8);

    da  = 8'b0;
    db  = 8'b10;
    op1 = 8'b0;
    dc  = 8'b101;
    dd  = 8'b1;
    op2 = 8'b0;
    de  = 8'b0001;
    df  = 8'b10101;
    op3 = 8'b0;
    #(PERIOD * 8); 
    
    $stop;
  end




endmodule
