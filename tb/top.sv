
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "driver.sv"

module top;

  adder_if vif();

  adder dut(.a(vif.a),
            .b(vif.b),
	    .y(vif.y)
	    );

  initial begin
    uvm_config_db#(virtual adder_if)::set(null, "*", "vif", vif);
  end

  initial begin
    run_test("driver");
  end

  initial begin
    $dumpfile("adder.vcd");
    $dumpvars;
  end

endmodule
