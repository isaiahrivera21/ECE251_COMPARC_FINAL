////////////////////////////////////////////////////////////////////////////////
//      
//      Module: Program Counter  
//      Hdl: Verilog
//
//      Module Description: Program Counter is a Register that takes in a n bit address. Then on a positive clock edge outputs it 
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef PC_COUNTER
`define PC_COUNTER

module pc_Counter(pc_next,clk,rst,pc);

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //
   parameter n = 32; 


   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input logic    [(n-1):0] pc_next; 
   input          clk, rst; 
   output logic   [(n-1):0] pc; 
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   always @ (posedge clk, posedge rst) begin

      if(rst)
      begin 
         pc <= 0; 
      end 
      else

      begin 
      pc <= pc_next; 
      end 
      
   end 
endmodule

`endif // EXAMPLE

