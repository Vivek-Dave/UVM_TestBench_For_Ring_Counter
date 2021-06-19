
interface intf(input bit clk);
    // ------------------- port declaration-------------------------------------
    logic rst;
    logic [7:0] out;
    //--------------------------------------------------------------------------

    //------------- clocking & modport declaration -----------------------------
    clocking cb @(posedge clk);
      default input #2 output #1step;
      output rst; //input of DUT
      input  out; //output of DUT
    endclocking
    //--------------------------------------------------------------------------
    
   //--------------------------  ASSERTION  ------------------------------------
    property check;
      disable iff(rst==1) 
      @(posedge clk) $onehot(out)==1;
    endproperty
  	
  	CHECK:assert property(check) $display("\t\t ASSERTION PASS");
    	  else 					 $display("\t\t ASSERTION FAIL");
   //--------------------------------------------------------------------------

endinterface

