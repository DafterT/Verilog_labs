
#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3


#**************************************************************
# Create Clock
#**************************************************************

create_clock -name clock_in -period 40.000 [get_ports {CLK}]

#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks -create_base_clocks

#**************************************************************
# Set Clock Latency
#**************************************************************




#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty

set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clock_in}] -rise_to [get_clocks {clock_in}]  0.100  
set_clock_uncertainty -rise_from [get_clocks {clock_in}] -fall_to [get_clocks {clock_in}]  0.100  
set_clock_uncertainty -fall_from [get_clocks {clock_in}] -rise_to [get_clocks {clock_in}]  0.100  
set_clock_uncertainty -fall_from [get_clocks {clock_in}] -fall_to [get_clocks {clock_in}]  0.100  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


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

