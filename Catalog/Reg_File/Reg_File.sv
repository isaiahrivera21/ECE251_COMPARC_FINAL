////////////////////////////////////////////////////////////////////////////////
//      
//      Module: Instruction Memeory  
//      Hdl: Verilog
//
//      Module Description: Extracts an instruction from a memeory adress 
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef REG_FILE
`define REG_FILE

module Reg_File();

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //
   parameter n = 5; //number of registers to read 
   parameter m = 32; //how many bits a register can hold 
   
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input    [(n - 1):0] A1, A2, A3;  //instruction ports 
   input                WE, clk;     //write enable and clk (both 1 bit)
   output   [(m - 1):0] RD1, RD2, WD; 
   reg [m:0] register [m]  //32 registers that are 32 bits wide 

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   always @(clk) begin 

      RD1 <= register[A1];
      RD2 <= register[A2];

      if (WE) begin
         register[A3] <= WD; 
      end
   end 

endmodule

`endif // EXAMPLE

//components of a reg_file read 1,read 2, read data 1, read data 2, write data, write enable, write 1 
