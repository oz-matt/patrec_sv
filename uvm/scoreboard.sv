import uvm_pkg::*;

class scoreboard extends uvm_scoreboard;
   `uvm_component_utils(scoreboard)
 
  uvm_in_order_class_comparator #(seq_packet) comparator;


  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: build_phase

endclass: scoreboard
