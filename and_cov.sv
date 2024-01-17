class and_cov extends uvm_subscriber#(and_tx);
`uvm_component_utils(and_cov)
and_tx tx;
covergroup cg;
		A1:coverpoint tx.a;
		B1:coverpoint tx.b;
endgroup

function new(string name,uvm_component parent);
	super.new(name,parent);
	cg=new();
endfunction

function void write(and_tx t);
$cast(tx,t);
cg.sample();
endfunction
endclass
