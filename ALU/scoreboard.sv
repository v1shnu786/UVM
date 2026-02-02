class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)

uvm_analysis_imp #(seq_item,scoreboard) aip;

function new(string name="scoreboard",uvm_component parent);
super.new(name,parent);
aip = new("aip",this);
endfunction

function void write(seq_item tr);
 bit [8:0]exp;
case(tr.s) 
0:exp=tr.a+tr.b;
1:exp=tr.a-tr.b;
2:exp=tr.a&tr.b;
3:exp=tr.a|tr.b; 
default: exp=0;
endcase

if(exp==tr.c) 
`uvm_info("passed",$sformatf("a=%0d,b=%0d,c=%0d",tr.a,tr.b,tr.c),UVM_LOW)
else
`uvm_error("failed",$sformatf("a=%0d,b=%0d,c=%0d,exp=%0d",tr.a,tr.b,tr.c,exp))
endfunction
endclass








