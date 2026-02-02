class driver extends uvm_driver #(seq_item);

  `uvm_component_utils(driver)

  seq_item    t1;
  virtual alu vif;

  function new(string name = "driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db #(virtual alu)::get(this, "", "vif", vif))
      `uvm_fatal("DRV", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);

    repeat(200) begin
      seq_item_port.get_next_item(t1);   
      
      vif.a = t1.a;
      vif.b = t1.b;
      vif.s = t1.s;

      #1;

      seq_item_port.item_done();         
    end
  endtask

endclass

