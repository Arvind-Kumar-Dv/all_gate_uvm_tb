class and_drv extends uvm_driver#(and_tx);
`uvm_component_utils(and_drv)
`NEW_COMP
and_tx tx;
virtual and_intf vif;
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	tx=new("tx");
	if(!uvm_config_db#(virtual and_intf)::get(this,"", "AND_IF",vif)) begin
	`uvm_error("drv_id","intf_error_msg");
	end
endfunction

task run_phase(uvm_phase phase);
		forever begin
seq_item_port.get_next_item(req);
	drive_tx(req);
	req.print();
seq_item_port.item_done();
end
endtask

task drive_tx(and_tx tx);
vif.a=tx.a;
vif.b=tx.b;
#2; // combinatio ckt delay we have to give the to see the waveform
endtask

endclass

