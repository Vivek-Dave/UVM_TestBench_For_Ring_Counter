
`include "interface.sv"
`include "tb_pkg.sv"
module top;
  import uvm_pkg::*;
  import tb_pkg::*;
  
  bit clk; // external signal declaration

  //----------------------------------------------------------------------------
  intf i_intf(clk);
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  ring_counter DUT(.rst(i_intf.rst),
                   .clk(i_intf.clk),
                   .out(i_intf.out)
                   );
  //----------------------------------------------------------------------------               
  
  initial begin
    clk = 0;
  end

  always #5 clk = ~clk;
  
  //----------------------------------------------------------------------------
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars;
  end
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  initial begin
    uvm_config_db#(virtual intf)::set(uvm_root::get(),"","vif",i_intf);
  end
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  initial begin
    run_test("ring_test");
  end
  //----------------------------------------------------------------------------
endmodule

