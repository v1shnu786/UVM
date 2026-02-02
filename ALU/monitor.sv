class monitor extends uvm_monitor;
`uvm_component_utils(monitor)
uvm_analysis_port #(seq_item) ap;
virtual alu vif;
seq_item m1;

function new(string name ="monitor",uvm_component parent);
super.new(name,parent);
ap=new("ap",this);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(virtual alu)::get(this,"","vif",vif))
`uvm_fatal("DIV","VIF not found");
endfunction

task run_phase(uvm_phase phase);
//super.run_phase(phase);
repeat(200) begin
m1=seq_item::type_id::create("m1",this);
m1.a=vif.a;
m1.b=vif.b;
m1.s=vif.s;
m1.c=vif.c;
#1;
ap.write(m1);
`uvm_info("monitor",$sformatf("a=%0d,b=%0d,s=%0d,c=%0d",m1.a,m1.b,m1.s,m1.c),UVM_LOW);
end
endtask
endclass


