import uvm_pkg::*;

class seq extends uvm_sequence#(seq_packet);
	`uvm_object_utils(seq)
	
	function new (string name = "seq");
		super.new(name);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
        set_automatic_phase_objection(1);
	endfunction
	
	task body; 
		repeat(20) begin 
			req = seq_packet::type_id::create("req"); 
			start_item(req); 
			if (!req.randomize()) begin 
				`uvm_error("MY_SEQUENCE", "Randomize failed."); 
			end 
			finish_item(req); 
		end 
	endtask: body

endclass