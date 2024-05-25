`timescale 1ns/1ns
module calc 
(
  interface_calc bus
);

always_comb begin
    bus.res = bus.op ? bus.a & bus.b : bus.a | bus.b;
end
    
endmodule