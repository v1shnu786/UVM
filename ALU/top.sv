`include "uvm_macros.svh"
import uvm_pkg::*;

`include "dut.sv"
`include "seq_item.sv"
`include "seq.sv"
`include "seqr.sv"
`include "interface.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "coverage.sv"
`include "env.sv"
`include "test.sv"


module top;

  alu vif();
  dut a1 (
    .a(vif.a),
    .b(vif.b),
    .s(vif.s),
    .c(vif.c)
  );

  initial begin

    uvm_config_db #(virtual alu)::set(null, "*", "vif", vif);

    run_test("test");
  end

endmodule

