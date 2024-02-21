module impl_Lab3_1 (
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "23"  *) 
		input CLK, 
	(* altera_attribute = "-name IO_STANDARD \"2.5 V\"", chip_pin = "64" *) 
		input RST,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "88" *)
		input DIR,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "84, 76, 85, 77, 86, 133, 87" *)
		output [6:0] HEX,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "73, 74, 80, 83" *)
		output [3:0] DIG
	);

Lab3_1 #(25'd25000000) Lab3_1_inst 
(
	.CLK		(CLK	),
	.RST		(RST	),
	.DIR		(DIR	),
	.DIG		(DIG 	),
	.HEX		(HEX	)
);

endmodule

