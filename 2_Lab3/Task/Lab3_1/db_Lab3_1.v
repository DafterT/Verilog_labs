module db_Lab3_1 (
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "23"  *) 
		input CLK
);
	wire [6:0] HEX;
	wire [3:0] DIG;
	wire	db_reset;
	wire 	db_dir;
	wire 	db_clk_high;
	
Lab3_1               Lab3_1_inst 
(
	.CLK		(CLK		),
	.RST		(db_reset	),
	.DIR		(db_dir		),
	.DIG	   (DIG 		),
	.HEX		(HEX		)
);
SP_unit SP_unit_inst (
	.source     ({db_reset, db_dir}	), 
	.probe      ({HEX, DIG}			), 
	.source_clk (CLK 				) 
);
PLL_unit PLL_unit_inst(
	.inclk0 	(CLK 		),
	.c0 		(db_clk_high) 
);
endmodule

