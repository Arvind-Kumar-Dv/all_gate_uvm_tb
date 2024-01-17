class and_seq extends uvm_sequence#(and_tx);
`uvm_object_utils(and_seq)
`NEW_OBJ
and_tx tx;

uvm_phase phase;
task pre_body();
		if(phase!=null) begin
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this,50);
		end
endtask

task post_body();
		if(phase!=null) begin
		phase.drop_objection(this);
		end

endtask

endclass

class seq1 extends and_seq;
`uvm_object_utils(seq1)
`NEW_OBJ
	task body();
		repeat(10) begin
			`uvm_do(req)
			end
	endtask

endclass
