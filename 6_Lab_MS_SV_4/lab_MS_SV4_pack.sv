package lab_MS_SV4_pack;
  parameter WIDTH = 8;
  typedef enum bit [2:0] { ADD, SUB, MUL, DIV, VAR } opcode_t;
  typedef bit signed [WIDTH-1:0] data_y;

  typedef struct packed {
    opcode_t opc;
    data_y   op_a;
    data_y   op_b;
  } INST_t;
endpackage : lab_MS_SV4_pack
