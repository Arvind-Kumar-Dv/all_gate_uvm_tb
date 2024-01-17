`uvm_analysis_imp_decl(_tx)
`uvm_analysis_imp_decl(_rx)
class and_sbd extends uvm_scoreboard;
`uvm_component_utils(and_sbd)
`NEW_COMP
uvm_analysis_imp_tx#(and_tx,and_sbd)ap_sbd;
uvm_analysis_imp_rx#(and_tx,and_sbd)ap_sbd1;
and_tx tx_q[$];
and_tx rx_q[$];
and_tx tx,rx;
function void build_phase(uvm_phase phase);
super.build_phase(phase);
ap_sbd=new("ap_sbd",this);
ap_sbd1=new("ap_sbd1",this);
endfunction

function void write_tx(and_tx tx1);
$display("#######  tx sbd ########");
tx_q.push_back(tx1);
endfunction

function void write_rx(and_tx tx2);
$display("#######  tx sbd ########");
rx_q.push_back(tx2);
endfunction

task run_phase(uvm_phase phase);
		repeat(10) begin
			if(tx_q.size()>0 && rx_q.size()>0 ) begin
			tx=tx_q.pop_front();
			rx=rx_q.pop_front();
			end
		if(tx.compare(rx)) begin
			$display(" ################  sbd pass #######################");
		end
		else
		    $display(" ################  sbd fail #######################");
end
endtask


endclass
