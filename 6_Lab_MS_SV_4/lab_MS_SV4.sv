`timescale 1ns / 1ns
import lab_MS_SV4_pack::*;

module lab_MS_SV4 (
  input  INST_t INST,
  output data_y ALU_out
);

  always_comb begin
    case (INST.opc)
      ADD: ALU_out = INST.op_a + INST.op_b;
      SUB: ALU_out = INST.op_a - INST.op_b;
      MUL: ALU_out = INST.op_a * INST.op_b;
      DIV: ALU_out = INST.op_a / INST.op_b;
      VAR: ALU_out = (INST.op_a + INST.op_b) / 2;
    endcase
  end
endmodule
