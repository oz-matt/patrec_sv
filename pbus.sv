`ifndef PBUS_SV
`define PBUS_SV

interface pbus (input bit clk);
	logic valid;
	logic resetn;
	logic ready;
	logic[7:0] data;
	logic match;
	
	modport pslave(
		input valid,
		input resetn,
		output ready,
		input data,
		output match
		);
	
endinterface


`endif