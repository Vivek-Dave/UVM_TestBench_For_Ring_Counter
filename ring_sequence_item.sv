class ring_sequence_item extends uvm_sequence_item;

  //------------ i/p || o/p field declaration-----------------

  logic rst;        //o/p
  logic [7:0] out;
  
  //---------------- register ring_sequence_item class with factory --------
  `uvm_object_utils_begin(ring_sequence_item) 
     `uvm_field_int( rst ,UVM_ALL_ON)
     `uvm_field_int( out ,UVM_ALL_ON)
  `uvm_object_utils_end
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="ring_sequence_item");
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // write DUT inputs here for printing
  function string input2string();
    return($sformatf(" rst=%0b ", rst));
  endfunction
  
  // write DUT outputs here for printing
  function string output2string();
    return($sformatf(" out=%8b", out));
  endfunction
    
  function string convert2string();
    return($sformatf({input2string(), " || ", output2string()}));
  endfunction
  //----------------------------------------------------------------------------

endclass:ring_sequence_item
