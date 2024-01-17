class base_test extends uvm_test;
`uvm_component_utils(base_test)
`NEW_COMP
and_env env;
 function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TEST_ID","PRINT_TEST_COMP",UVM_LOW)
		 env=and_env::type_id::create("env",this);
endfunction
function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();
		//uvm_factory factory=uvm_factory::get();
		//factory.print();
 endfunction

endclass

class test1 extends base_test;
`uvm_component_utils(test1)
`NEW_COMP
task run_phase(uvm_phase phase);
seq1 s1;
s1=seq1::type_id::create("s1",this);
phase.raise_objection(this);
s1.start(env.agent.sqr);
phase.drop_objection(this);
phase.phase_done.set_drain_time(this,100);
endtask

endclass
