`timescale 1ns / 1ns
import lab_MS_SV4_pack::*;

module tb_lab_MS_SV4 ();
  INST_t INST;
  data_y ALU_out;

  lab_MS_SV4 DUT (
    .ALU_out,
    .INST
  );

  initial begin
    INST.opc = INST.opc.first();
    do begin
      INST.op_a = 10;
      INST.op_b = -5;
      #10 INST.opc = INST.opc.next();
    end while (INST.opc != INST.opc.last());

    #20 INST.opc = INST.opc.first();
    do begin
      INST.op_a = 5;
      INST.op_b = -5;
      #10 INST.opc = INST.opc.next();
    end while (INST.opc != INST.opc.last());

    #10;
    $display("\n");
    $stop;
  end
  initial
    $monitor(
        "\n \tinstruction=%p \top_a=%d \top_b%d \tALU_out=%d",
        INST.opc,
        INST.op_a,
        INST.op_b,
        ALU_out
    );
endmodule
