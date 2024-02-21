vlib work
vlog Lab3_1.v
vlog tb_Lab3_1.v
vsim work.tb_Lab3_1
add wave -position end  sim:/tb_Lab3_1/tb_clk
add wave -position end  sim:/tb_Lab3_1/tb_dir
add wave -position end  sim:/tb_Lab3_1/tb_dig
add wave -position end  sim:/tb_Lab3_1/tb_hex
add wave -position end  sim:/tb_Lab3_1/tb_reset
add wave -position end  sim:/tb_Lab3_1/tb_ss
add wave -position end  sim:/tb_Lab3_1/Lab3_1_inst/div_cnt
add wave -position end  sim:/tb_Lab3_1/Lab3_1_inst/cout
add wave -position end  sim:/tb_Lab3_1/Lab3_1_inst/Counter
run -all