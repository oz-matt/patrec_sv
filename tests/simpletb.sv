
module simpletb;
	import axil_if_c::*;
	import uvm_pkg::*;
	import prenv::*;
	
	axilite_int#(1,32,8) vif();
	
	patrec patrec_inst(.io(vif.slave));
	
	initial begin
		vif.AXI_ACLK = 0;
		forever #10 vif.AXI_ACLK = ~vif.AXI_ACLK;
	end
	
	initial begin
		uvm_config_db#(virtual axilite_int#(1,32,8))::set(null, "*", "vif", vif);
  		$timeformat(-9, 1, "ns", 10);
		run_test();
	end
	
	
	function void placebyte(bit[7:0] nbyte);
		$display("sent %b at %t", nbyte, $time());
	endfunction
	
endmodule