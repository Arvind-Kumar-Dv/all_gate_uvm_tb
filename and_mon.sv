class and_mon extends uvm_monitor;
`uvm_component_utils(and_mon)
`NEW_COMP
uvm_analysis_port#(and_tx)ap_port;
and_tx tx;

virtual and_intf vif;

function void build_phase(uvm_phase phase);
super.build_phase(phase);
	if(!uvm_config_db#(virtual and_intf)::get(this,"", "AND_IF",vif)) begin
	`uvm_error("mon_id","intf_error_msg");
	end
ap_port=new("ap_port",this);

endfunction

task run_phase(uvm_phase phase);

		$display("########### monitor outside ###############");
		repeat(10) begin
				$display("########### monitor ###############");
			tx=new();
			tx.a=vif.a;
			tx.b=vif.b;
			tx.y=vif.y;
			ap_port.write(tx);
		end
		//tx.print();
endtask

endclass
