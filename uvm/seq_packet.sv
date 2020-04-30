import uvm_pkg::*;

class seq_packet extends uvm_sequence_item;
	
	rand bit bt;
	
    `uvm_object_utils_begin(seq_packet)
        `uvm_field_int(bt, UVM_ALL_ON)
    `uvm_object_utils_end
    
    
    function new(string name = "seq_packet");
        super.new(name);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    endfunction: new
  
endclass