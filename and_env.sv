class and_env extends uvm_env;
`uvm_component_utils(and_env)
`NEW_COMP
and_agent agent;
and_sbd sbd;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	agent=and_agent::type_id::create("this",this);
	sbd=and_sbd::type_id::create("sbd",this);
endfunction

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	agent.mon.ap_port.connect(sbd.ap_sbd);
	agent.mon.ap_port.connect(sbd.ap_sbd1);
endfunction
endclass
