module exam (
  input  bit        clk,
  input  bit        rst_in,
  input  bit [ 7:0] data_1,
  input  bit [ 7:0] data_2,
  input  bit [ 7:0] data_3,
  output bit [15:0] data_out,
  input  bit        valid_1,
  input  bit        valid_2,
  input  bit        valid_3,
  output bit        valid_out,
  output bit        ready_1,
  output bit        ready_2,
  output bit        ready_3,
  input  bit        ready_out
);

  bit [1:0] rst = '0;

  always_ff @(posedge clk) begin
    rst[1:0] <= {rst[0], rst_in};
  end

  my_qsys u0 (
    .clk_clk                  (clk),        //                 clk.clk
    .reset_reset_n            (rst[1]),     //               reset.reset_n
    .my_component_0_in0_data  (data_1),     //  my_component_0_in0.data
    .my_component_0_in0_ready (ready_1),    //                    .ready
    .my_component_0_in0_valid (valid_1),    //                    .valid
    .my_component_0_in1_data  (data_2),     //  my_component_0_in1.data
    .my_component_0_in1_ready (ready_2),    //                    .ready
    .my_component_0_in1_valid (valid_2),    //                    .valid
    .my_component_0_in2_data  (data_3),     //  my_component_0_in2.data
    .my_component_0_in2_ready (ready_3),    //                    .ready
    .my_component_0_in2_valid (valid_3),    //                    .valid
    .my_component_0_out0_data (data_out),   // my_component_0_out0.data
    .my_component_0_out0_ready(ready_out),  //                    .ready
    .my_component_0_out0_valid(valid_out)   //                    .valid
  );

endmodule
