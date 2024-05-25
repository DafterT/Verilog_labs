module exam #(
  parameter w = 3
) (
  interface_exam bus
);

  interface_reg #(w) interface_reg (
    bus.clk,
    bus.da,
    bus.db,
    bus.op1,
    _a,
    _b,
    _c
  );
  rg rg (
    interface_reg
  );


  interface_reg #(w) interface_reg2 (
    bus.clk,
    bus.dc,
    bus.dd,
    bus.op2,
    _a2,
    _b2,
    _c2
  );
  rg rg1 (
    interface_reg2
  );


  interface_reg #(w) interface_reg3 (
    bus.clk,
    bus.de,
    bus.df,
    bus.op3,
    _a3,
    _b3,
    _c3
  );
  rg rg2 (
    interface_reg3
  );


  interface_calc #(w) calc_interf (
    interface_reg._a,
    interface_reg._b,
    interface_reg._c,
    res
  );
  calc calc (calc_interf);


  interface_calc #(w) calc_interf1 (
    interface_reg2._a,
    interface_reg2._b,
    interface_reg2._c,
    res1
  );
  calc calc2 (calc_interf1);

  interface_calc #(w) calc_interf2 (
    interface_reg3._a,
    interface_reg3._b,
    interface_reg3._c,
    res2
  );
  calc calc3 (calc_interf2);


  interface_reg #(w) interface_reg4 (
    bus.clk,
    calc_interf.res,
    calc_interf1.res,
    calc_interf2.res,
    _a4,
    _b4,
    _c4
  );

  rg rg_reg (
    interface_reg4
  );

  assign bus.Ra = interface_reg4._a;
  assign bus.Rb = interface_reg4._b;
  assign bus.Rc = interface_reg4._c;



endmodule
