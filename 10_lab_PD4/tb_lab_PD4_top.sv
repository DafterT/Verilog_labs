`timescale 1ns/1ns
module tb_lab_PD4_top ();

bit clk;
bit reset;
bit [7:0] data_d, dd_slave, d_slave, def_slave;

assign data_d = 8'd18;

always #10 clk = ~clk;

initial begin
	#20;
	reset = 1'b1;
	repeat (4*260) @ (negedge clk);
	$stop;
end
	lab_PD4_top Lab4_sys_top_inst (.*);
endmodule 