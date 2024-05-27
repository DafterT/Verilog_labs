# TCL File Generated by Component Editor 16.1
# Mon May 27 11:59:47 MSK 2024
# DO NOT MODIFY


# 
# my_component "my_component" v1.0
#  2024.05.27.11:59:47
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module my_component
# 
set_module_property DESCRIPTION ""
set_module_property NAME my_component
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP exam
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME my_component
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL my_module
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file my_module.sv SYSTEM_VERILOG PATH my_module.sv TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset rsi_reset reset Input 1


# 
# connection point in0
# 
add_interface in0 avalon_streaming end
set_interface_property in0 associatedClock clock
set_interface_property in0 associatedReset reset
set_interface_property in0 dataBitsPerSymbol 8
set_interface_property in0 errorDescriptor ""
set_interface_property in0 firstSymbolInHighOrderBits true
set_interface_property in0 maxChannel 0
set_interface_property in0 readyLatency 0
set_interface_property in0 ENABLED true
set_interface_property in0 EXPORT_OF ""
set_interface_property in0 PORT_NAME_MAP ""
set_interface_property in0 CMSIS_SVD_VARIABLES ""
set_interface_property in0 SVD_ADDRESS_GROUP ""

add_interface_port in0 asi_in0_data data Input 8
add_interface_port in0 asi_in0_ready ready Output 1
add_interface_port in0 asi_in0_valid valid Input 1


# 
# connection point in1
# 
add_interface in1 avalon_streaming end
set_interface_property in1 associatedClock clock
set_interface_property in1 associatedReset reset
set_interface_property in1 dataBitsPerSymbol 8
set_interface_property in1 errorDescriptor ""
set_interface_property in1 firstSymbolInHighOrderBits true
set_interface_property in1 maxChannel 0
set_interface_property in1 readyLatency 0
set_interface_property in1 ENABLED true
set_interface_property in1 EXPORT_OF ""
set_interface_property in1 PORT_NAME_MAP ""
set_interface_property in1 CMSIS_SVD_VARIABLES ""
set_interface_property in1 SVD_ADDRESS_GROUP ""

add_interface_port in1 asi_in1_data data Input 8
add_interface_port in1 asi_in1_ready ready Output 1
add_interface_port in1 asi_in1_valid valid Input 1


# 
# connection point in2
# 
add_interface in2 avalon_streaming end
set_interface_property in2 associatedClock clock
set_interface_property in2 associatedReset reset
set_interface_property in2 dataBitsPerSymbol 8
set_interface_property in2 errorDescriptor ""
set_interface_property in2 firstSymbolInHighOrderBits true
set_interface_property in2 maxChannel 0
set_interface_property in2 readyLatency 0
set_interface_property in2 ENABLED true
set_interface_property in2 EXPORT_OF ""
set_interface_property in2 PORT_NAME_MAP ""
set_interface_property in2 CMSIS_SVD_VARIABLES ""
set_interface_property in2 SVD_ADDRESS_GROUP ""

add_interface_port in2 asi_in2_data data Input 8
add_interface_port in2 asi_in2_ready ready Output 1
add_interface_port in2 asi_in2_valid valid Input 1


# 
# connection point out0
# 
add_interface out0 avalon_streaming start
set_interface_property out0 associatedClock clock
set_interface_property out0 associatedReset reset
set_interface_property out0 dataBitsPerSymbol 8
set_interface_property out0 errorDescriptor ""
set_interface_property out0 firstSymbolInHighOrderBits true
set_interface_property out0 maxChannel 0
set_interface_property out0 readyLatency 0
set_interface_property out0 ENABLED true
set_interface_property out0 EXPORT_OF ""
set_interface_property out0 PORT_NAME_MAP ""
set_interface_property out0 CMSIS_SVD_VARIABLES ""
set_interface_property out0 SVD_ADDRESS_GROUP ""

add_interface_port out0 aso_out0_data data Output 16
add_interface_port out0 aso_out0_ready ready Input 1
add_interface_port out0 aso_out0_valid valid Output 1


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock csi_clk clk Input 1

