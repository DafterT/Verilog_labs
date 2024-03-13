`timescale 1ns / 1ns
import lab_MS_SV4_pack::*;

module tb_lab_MS_SV4 ();
  INST_t INST;
  data_y ALU_out;

  lab_MS_SV4 DUT (.*);

  task test(
    input data_y a,
    input data_y b
  );
    INST.opc = INST.opc.first();
    do begin
      INST.op_a = a;
      INST.op_b = b;
      #10 INST.opc = INST.opc.next();
    end while (INST.opc != INST.opc.last());
    #10;
    $display("\n");
  endtask

  initial begin
    test(10, -5);
    test(127, 127);
    test(-128, -128);
    test(10, 0);
    $display("\n");
    $stop;
  end
  initial
    $monitor(
        "instruction=%p \top_a=%d \top_b=%d \tALU_out=%d",
        INST.opc,
        INST.op_a,
        INST.op_b,
        ALU_out
    );
endmodule
