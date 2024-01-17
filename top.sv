
`include "uvm_pkg.sv"
 import uvm_pkg::*;
`include "and_rtl.v"
`include "and_common.sv"
`include "and_intf.sv"
`include "and_tx.sv"
`include "and_seq.sv"
`include "and_cov.sv"
`include "and_mon.sv"
`include "and_sqr.sv"
`include "and_drv.sv"
`include "and_agent.sv"
`include "and_sbd.sv"
`include "and_env.sv"
`include "and_test_lib.sv"
module top;
reg a,b;
wire y;
and_intf pif();
and_rtl dut(
			.a(pif.a),
			.b(pif.b),
			.y(pif.y)

			);

	initial begin
	uvm_config_db#(virtual and_intf)::set(uvm_root::get(),"*", "AND_IF",pif);
	end
				
initial begin
run_test("test1");
end
endmodule
