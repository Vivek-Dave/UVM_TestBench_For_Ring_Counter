
class ring_monitor extends uvm_monitor;
  //----------------------------------------------------------------------------
  `uvm_component_utils(ring_monitor)
  //----------------------------------------------------------------------------

  //------------------- constructor --------------------------------------------
  function new(string name="ring_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
  //---------------- sequence_item class ---------------------------------------
  ring_sequence_item  txn;
  int unsigned count=0;
  //----------------------------------------------------------------------------
  
  //------------------------ virtual interface handle---------------------------  
  virtual interface intf vif;
  //----------------------------------------------------------------------------

  //------------------------ analysis port -------------------------------------
  uvm_analysis_port#(ring_sequence_item) ap_mon;
  //----------------------------------------------------------------------------
  
  //------------------- build phase --------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif)))
    begin
      `uvm_fatal("monitor","unable to get interface")
    end
    
    ap_mon=new("ap_mon",this);
  endfunction
  //----------------------------------------------------------------------------

  //-------------------- run phase ---------------------------------------------
  task run_phase(uvm_phase phase);
    ring_sequence_item txn=ring_sequence_item::type_id::create("txn");
    forever
    begin
      sample_dut(txn);
      ap_mon.write(txn);
    end
  endtask
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  task sample_dut(output ring_sequence_item txn);
    ring_sequence_item t = ring_sequence_item::type_id::create("t");
    @(vif.cb);
    t.rst = vif.rst;
    t.out = vif.out;
    txn   = t;
    //------------------------------ CHECK OUTPUT HERE -------------------
    if(t.rst==1 && count>0) begin 
      `uvm_info ("[ RESET ]", "----------- RESET ----------" , UVM_MEDIUM)
      count=0;
    end
    else begin 
      if($onehot(t.out)===1 && count>0) begin 
        `uvm_info (" [ PASS ]",t.output2string(), UVM_MEDIUM)
      end
      else if($onehot(t.out)!==1 && count>0) begin 
        `uvm_warning (" [ FAIL ]","\t\t FAIL")
      end
      count++;
    end
    //--------------------------------------------------------------------
  endtask
  //----------------------------------------------------------------------------

endclass:ring_monitor

