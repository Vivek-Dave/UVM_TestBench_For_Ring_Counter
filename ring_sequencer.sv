

class ring_sequencer extends uvm_sequencer#(ring_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(ring_sequencer)  
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="ring_sequencer",uvm_component parent);  
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
endclass:ring_sequencer

