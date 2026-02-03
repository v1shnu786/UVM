class test extends uvm_test;
`uvm_component_utils(test)

env e1;
seq sq;

function new(string name="test",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
e1=env::type_id::create("e1",this);
sq=seq::type_id::create("sq");
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
phase.raise_objection(this);
sq.start(e1.a1.s1);
phase.drop_objection(this);
endtask
endclass


