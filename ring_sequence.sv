
/***************************************************
** class name  : ring_sequence
** description : rst==0
***************************************************/
class ring_sequence extends uvm_sequence#(ring_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_object_utils(ring_sequence)            
  //----------------------------------------------------------------------------

  ring_sequence_item txn;

  //----------------------------------------------------------------------------
  function new(string name="ring_sequence");  
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  virtual task body();
    txn=ring_sequence_item::type_id::create("txn");
    start_item(txn);
    txn.rst=0;
    finish_item(txn);
  endtask:body
  //----------------------------------------------------------------------------
endclass:ring_sequence

/***************************************************
** class name  : reset_sequence
** description : rst==1
***************************************************/
class reset_sequence extends ring_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(reset_sequence)      
  //----------------------------------------------------------------------------
  
  ring_sequence_item txn;
  
  //----------------------------------------------------------------------------
  function new(string name="reset_sequence");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    txn=ring_sequence_item::type_id::create("txn");
    start_item(txn);
    txn.rst=1;
    finish_item(txn);
  endtask:body
  //----------------------------------------------------------------------------
  
endclass