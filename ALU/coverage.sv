class coverage extends uvm_component;
`uvm_component_utils(coverage)
uvm_analysis_imp #(seq_item,coverage) aic;

seq_item sc;
covergroup cg;
a_data: coverpoint sc.a{bins low={[0:5]};
                        bins middle={[6:11]};
                        bins high={[11:31]};}

b_data: coverpoint sc.b{bins low={[0:5]};
                        bins middle={[6:11]};
                        bins high={[11:31]};}

s_data: coverpoint sc.s{bins avg={[0:3]};}
c_data: coverpoint sc.c{bins avg={[0:31]};}
endgroup
                        
function new(string name="coverage",uvm_component parent);
super.new(name,parent);
aic=new("aic",this);
cg=new();
endfunction

function void write(seq_item s1);
sc=s1;
cg.sample();
endfunction

function void report_phase(uvm_phase phase);
`uvm_info(get_type_name(),$sformatf("Coverage = %0.2f%%",cg.get_coverage()),UVM_LOW);
endfunction
endclass
