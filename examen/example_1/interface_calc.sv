interface interface_calc
#(parameter w = 8) 
(
  input bit op,
  input bit [w - 1:0] a, b,
  output bit [w - 1:0] res
);

endinterface