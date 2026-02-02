class seq_item extends uvm_sequence_item;
`uvm_object_utils(seq_item)

rand bit [7:0]a,b;
rand bit [1:0]s;
     bit  [8:0]c;

function new(string name="seq_item");
super.new(name);
endfunction

endclass

