class and_agent extends uvm_agent;
`uvm_component_utils(and_agent)
`NEW_COMP
and_drv drv;
and_sqr sqr;
and_mon mon;
and_cov cov;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	drv=and_drv::type_id::create("drv",this);
	sqr=and_sqr::type_id::create("sqr",this);
	mon=and_mon::type_id::create("mon",this);
	cov=and_cov::type_id::create("cov",this);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
drv.seq_item_port.connect(sqr.seq_item_export);
mon.ap_port.connect(cov.analysis_export);
endfunction

endclass
