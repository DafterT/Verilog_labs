interface interface_exam
  #(parameter W = 3) (
    input bit clk
  );
  bit [W - 1:0] da, db, dc, dd, de, df, Ra, Rb, Rc;
  bit op1, op2, op3;

endinterface