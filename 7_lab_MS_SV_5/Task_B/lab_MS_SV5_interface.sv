interface bus_MM (
  input bit CLK,
  input bit reset
);
  bit [7:0] address;
  bit [7:0] writedata;
  bit       write;

  modport master(input CLK, reset, output address, writedata, write);
  modport slave(input CLK, reset, address, writedata, write);
endinterface
