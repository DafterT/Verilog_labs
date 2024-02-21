vlib work
vlog cnt.v
vlog lab2_2.v
vlog pwr.v
vlog tb_lab2_2.v
vsim -L lpm_ver work.tb_lab2_2
add wave /tb_lab2_2/lab2_2_inst/CLK
add wave /tb_lab2_2/lab2_2_inst/aRSTin
add wave -format Analog-Step -height 128 -max 255.0 -radix unsigned /tb_lab2_2/lab2_2_inst/Dcnt
add wave -format Analog-Step -height 512 -max 65025.0 -radix unsigned /tb_lab2_2/lab2_2_inst/Dout
run -all
