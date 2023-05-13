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

module pc_Counter(pc_next,clk,pc);

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //
   parameter n = 32; 


   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input logic    [(n-1):0] pc_next; 
   input          clk; 
   output logic   [(n-1):0] pc; 
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   always @ (posedge clk) begin
      pc <= pc_next; 
   end 
endmodule

`endif // EXAMPLE

