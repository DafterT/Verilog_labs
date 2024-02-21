`timescale 1ns/1ns
module Lab3_1 
#( parameter div_par = 25'd4) (
	input CLK, 
	input RST,
	input DIR,
	output [3:0] DIG,
	output reg [6:0] HEX
);
	reg 	[24:0] 	div_cnt 	= 25'd1;  //Clock divider
	wire 			cout;				  //Carry out
	reg 	[3:0]	cnt_val;              //value to count
	reg 	[1:0] 	rst_int 	= 2'd0;	  //Synchronized reset
	reg 	[3:0] 	Counter 	= 4'd0;   //Counter    
//============================================================
// Reset  
//
always @(posedge CLK)
	rst_int <= {rst_int[0], RST};   
//============================================================
// Clock Divider
//
always @(posedge CLK, negedge rst_int[1])
	if(!rst_int[1] ) 
		div_cnt <= 25'd1;			      
	else
		 
			 
		 
			div_cnt <= div_cnt + 25'd1;

assign cout = (div_cnt == div_par);	
//============================================================
// Counter
//
always @(posedge CLK)
	cnt_val = (DIR)? (-4'd1):(4'd1); //value for counting

always @(posedge CLK, negedge rst_int[1])
	if(!rst_int[1]) 
		Counter <= 4'd0;			     
	else 
		if (cout) 
		begin
			Counter <= Counter + cnt_val;
			case ({DIR, Counter})
				5'b10000: Counter <= 4'd9;
				5'b01001: Counter <= 4'd0;	
			endcase
		end
//============================================================
// Coder
//
always @(posedge CLK, negedge rst_int[1])
if(!rst_int[1])  HEX <= 7'b0111111;
else 
	case(Counter) 
		4'b0000: HEX <= 7'b0111111; // "0"     
		4'b0001: HEX <= 7'b0000110; // "1" 
		4'b0010: HEX <= 7'b1011011; // "2" 
		4'b0011: HEX <= 7'b1001111; // "3" 
		4'b0100: HEX <= 7'b1100110; // "4" 
		4'b0101: HEX <= 7'b1101101; // "5" 
		4'b0110: HEX <= 7'b1111101; // "6" 
		4'b0111: HEX <= 7'b0000111; // "7" 
		4'b1000: HEX <= 7'b1111111; // "8"     
		4'b1001: HEX <= 7'b1101111; // "9" 
		default: HEX <= 7'b0111111; // "0"
	endcase
//============================================================
// Constant value
//
assign DIG 	= 4'b1000;
//============================================================
endmodule
 
 