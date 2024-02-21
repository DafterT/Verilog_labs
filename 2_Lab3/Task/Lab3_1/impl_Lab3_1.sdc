
#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3


#**************************************************************
# Create Clock
#**************************************************************
create_clock -name {clock_in} -period 40.000 -waveform { 0.000 20.000 } [get_ports {CLK}]

#**************************************************************
# Create Generated Clock
#**************************************************************

#**************************************************************
# Set Clock Latency
#**************************************************************

#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty


set_clock_uncertainty -rise_from [get_clocks {clock_in}] -rise_to [get_clocks {clock_in}]  0.100  
set_clock_uncertainty -rise_from [get_clocks {clock_in}] -fall_to [get_clocks {clock_in}]  0.100  
set_clock_uncertainty -fall_from [get_clocks {clock_in}] -rise_to [get_clocks {clock_in}]  0.100  
set_clock_uncertainty -fall_from [get_clocks {clock_in}] -fall_to [get_clocks {clock_in}]  0.100  


#**************************************************************
# Set Input Delay
#**************************************************************
set_input_delay -add_delay  -clock [get_clocks {clock_in}]  5.000 [get_ports {DIR}]
set_input_delay -add_delay  -clock [get_clocks {clock_in}]  5.000 [get_ports {RST}]


#**************************************************************
# Set Output Delay
#**************************************************************
set_output_delay -add_delay  -clock [get_clocks {clock_in}]  5.000 [get_ports {HEX[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock_in}]  5.000 [get_ports {HEX[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock_in}]  5.000 [get_ports {HEX[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock_in}]  5.000 [get_ports {HEX[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock_in}]  5.000 [get_ports {HEX[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock_in}]  5.000 [get_ports {HEX[5]}]
set_output_delay -add_delay  -clock [get_clocks {clock_in}]  5.000 [get_ports {HEX[6]}]


#**************************************************************
# Set Clock Groups
#**************************************************************


#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

