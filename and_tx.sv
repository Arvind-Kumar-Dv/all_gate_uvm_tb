class and_tx extends uvm_sequence_item;
rand bit a;
rand bit b;
     bit y;
`NEW_OBJ
`uvm_object_utils_begin(and_tx)
	`uvm_field_int(a,UVM_ALL_ON)
	`uvm_field_int(b,UVM_ALL_ON)
	`uvm_field_int(y,UVM_ALL_ON)
`uvm_object_utils_end

endclass
