module fsm (
  input  bit CLK,
  input  bit rst_n,
  input  bit inA,
  input  bit inB,
  output bit AeqB,
  output bit AmB,
  output bit BmA
);

  enum bit [1:0] {
    EQ,
    A_,
    B_
  } states;

  always_ff @(posedge CLK, negedge rst_n) begin
    if (~rst_n) states <= EQ;
    else
      case (states)
        EQ: if (inA & ~inB) states <= A_;
            else if (~inA & inB) states <= B_;
        A_: if (~inA & inB) states <= EQ;
        B_: if (inA & ~inB) states <= EQ;
      endcase
  end

  always_comb begin
    AeqB = 1'd0;
    AmB  = 1'd0;
    BmA  = 1'd0;
    case (states)
      EQ: AeqB = 1'd1;
      A_: AmB = 1'd1;
      B_: BmA = 1'd1;
    endcase
  end

endmodule
