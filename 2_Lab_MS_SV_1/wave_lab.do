onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_lab_MS_SV1/CLK
add wave -noupdate /tb_lab_MS_SV1/rst_n
add wave -noupdate -radix unsigned /tb_lab_MS_SV1/cntA_Module
add wave -noupdate -radix unsigned /tb_lab_MS_SV1/cntA
add wave -noupdate /tb_lab_MS_SV1/CoutA
add wave -noupdate -radix unsigned /tb_lab_MS_SV1/cntB_Module
add wave -noupdate -radix unsigned /tb_lab_MS_SV1/cntB
add wave -noupdate /tb_lab_MS_SV1/CoutB
add wave -noupdate /tb_lab_MS_SV1/AeqB
add wave -noupdate /tb_lab_MS_SV1/AmB
add wave -noupdate /tb_lab_MS_SV1/BmA
add wave -noupdate /tb_lab_MS_SV1/cntA_EQ_cntB
add wave -noupdate /tb_lab_MS_SV1/u_lab_MS_SV1/U_fsm/states
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {640000 ps} 0} {{Cursor 2} {1280000 ps} 0} {{Cursor 4} {1920000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 285
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {2688 ns}
