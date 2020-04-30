class iMonitor extends uvm_monitor;
  `uvm_component_utils(iMonitor)
  
	virtual axilite_int#(1,32,8) vif;

  uvm_analysis_port #(seq_packet) analysis_port;


  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    uvm_config_db#(virtual axilite_int#(1,32,8))::get(this, "", "vif", vif);

    analysis_port = new("analysis_port", this);

  endfunction: build_phase
virtual task run_phase(uvm_phase phase);

    seq_packet tr;
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    forever begin

      tr = seq_packet::type_id::create("tr", this);
      tr.bt = vif.AXI_ARVALID;
      get_packet(tr);
      `uvm_info("Got_Input_Packet", {"\n", tr.sprint()}, UVM_MEDIUM);
      analysis_port.write(tr);

    end
  endtask: run_phase
endclass: iMonitor