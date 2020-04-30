module patrec_top(input bit clk);
	
	pbus bus(.*);
	
	patrec patrec_inst(.*, .io(bus.pslave));
	
endmodule