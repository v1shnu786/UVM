class agent extends uvm_agent;
`uvm_component_utils(agent)

seqr s1;
driver d1;
monitor m1;

function new(string name ="agent",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
s1=seqr::type_id::create("s1",this);
d1=driver::type_id::create("d1",this);
m1=monitor::type_id::create("m1",this);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
d1.seq_item_port.connect(s1.seq_item_export);
endfunction
endclass


