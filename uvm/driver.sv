import uvm_pkg::*;

//`include "uvm/seq_packet.sv"

class drv extends uvm_driver#(seq_packet);
	`uvm_component_utils(drv)
	
	virtual axilite_int#(1,32,8) vif;
	
	function new (string name, uvm_component parent);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH)
	endfunction
	
	function void build_phase(uvm_phase phase);
    	super.build_phase(phase);
    	`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		
    	//uvm_config_db#(int)::get(this, "", "port_id", port_id);
    	uvm_config_db#(virtual axilite_int#(1,32,8))::get(this, "", "vif", vif);
		
	endfunction: build_phase
	
	function void end_of_elaboration_phase(uvm_phase phase);
    	super.end_of_elaboration_phase(phase);
    	`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    	if (vif == null) begin
      		`uvm_fatal("CFGERR", "Interface for Driver not set");
    	end

  	endfunction: end_of_elaboration_phase

	virtual task run_phase(uvm_phase phase);
    	`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		
		forever begin
			repeat(5) @(posedge vif.AXI_ACLK);
			seq_item_port.get_next_item(req);
		    
		    vif.AXI_ARVALID <= req.bt;
		    `uvm_info("DRV_RUN", {"\n", req.sprint()}, UVM_MEDIUM);
			
			seq_item_port.item_done();
		end
	endtask
endclass