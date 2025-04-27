
class driver extends uvm_driver;
  `uvm_component_utils(driver)

  function new(string name = "driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual adder_if vif;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db#(virtual adder_if)::get(this, "", "vif", vif))
      `uvm_fatal(get_full_name(), "Unable to access the virtual interface");

  endfunction

  virtual task run_phase(uvm_phase phase);

    phase.raise_objection(this);
    for(int i = 0; i < 10; i++) begin
      vif.a <= $urandom;
      vif.b <= $urandom;
      #10;
    end
    phase.drop_objection(this);

  endtask

endclass
