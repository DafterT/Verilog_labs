module cmp_eq (
    input bit [9:0] A,
    input bit [9:0] B,
    output bit EQ
);

always_comb EQ = A == B;

endmodule