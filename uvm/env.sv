import uvm_pkg::*;

class sys_env extends uvm_env;
  `uvm_component_utils(sys_env)
  
  agt agent;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    agent = agt::type_id::create("agent", this);
  endfunction: build_phase

endclass: sys_env
