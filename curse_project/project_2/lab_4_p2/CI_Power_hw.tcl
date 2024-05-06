# TCL File Generated by Component Editor 18.1
# Mon May 06 15:22:42 MSK 2024
# DO NOT MODIFY


# 
# CI_018 "CI_018" v1.1
#  2024.05.06.15:22:42
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module CI_018
# 
set_module_property DESCRIPTION ""
set_module_property NAME CI_018
set_module_property VERSION 1.1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Custom Instruction Modules"
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME CI_018
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL CI_018
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file CI_018.sv SYSTEM_VERILOG PATH CI_018.sv TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point avalon_slave_CI_1
# 
add_interface avalon_slave_CI_1 nios_custom_instruction end
set_interface_property avalon_slave_CI_1 clockCycle 0
set_interface_property avalon_slave_CI_1 operands 2
set_interface_property avalon_slave_CI_1 ENABLED true
set_interface_property avalon_slave_CI_1 EXPORT_OF ""
set_interface_property avalon_slave_CI_1 PORT_NAME_MAP ""
set_interface_property avalon_slave_CI_1 CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave_CI_1 SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave_CI_1 dataa dataa Input 32
add_interface_port avalon_slave_CI_1 datab datab Input 32
add_interface_port avalon_slave_CI_1 result result Output 32

