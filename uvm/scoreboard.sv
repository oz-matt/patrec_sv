import uvm_pkg::*;

class scoreboard extends uvm_scoreboard;
   `uvm_component_utils(scoreboard)
 
  uvm_in_order_class_comparator #(seq_packet) comparator;

  uvm_analysis_export #(seq_packet) before_export;
  uvm_analysis_export #(seq_packet) after_export;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	  
    comparator = packet_cmp::type_id::create("comparator", this);
    before_export = new("before_export", this);
    after_export  = new("after_export", this);
  endfunction: build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	  
    this.before_export.connect(comparator.before_export);
    this.after_export.connect(comparator.after_export); 
  endfunction: connect_phase
  
virtual function string convert2string();
    return $sformatf("Comparator Matches = %0d, Mismatches = %0d", comparator.m_matches, comparator.m_mismatches);
  endfunction: convert2string

endclass: scoreboard
