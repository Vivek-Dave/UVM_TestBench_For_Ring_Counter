
`ifndef TB_PKG
`define TB_PKG
`include "uvm_macros.svh"
package tb_pkg;
 import uvm_pkg::*;
 `include "ring_sequence_item.sv"        // transaction class
 `include "ring_sequence.sv"             // sequence class
 `include "ring_sequencer.sv"            // sequencer class
 `include "ring_driver.sv"               // driver class
 `include "ring_monitor.sv"              // monitor class
 `include "ring_agent.sv"                // agent class  
 `include "ring_coverage.sv"             // coverage class
// `include "ring_scoreboard.sv"           // scoreboard class
 `include "ring_env.sv"                  // environment class

 `include "ring_test.sv"                 // test1
 //`include "test2.sv"
 //`include "test3.sv"

endpackage
`endif 


