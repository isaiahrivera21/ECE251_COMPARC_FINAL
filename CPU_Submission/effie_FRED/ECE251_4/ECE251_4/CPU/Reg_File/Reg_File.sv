////////////////////////////////////////////////////////////////////////////////
//      
//      Module: Instruction Memeory  
//      Hdl: Verilog
//
//      Module Description: Register file containing 32 registers 
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef REG_FILE
`define REG_FILE

module Reg_File(A1,A2,A3,WD,WE,clk,RD1,RD2);

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //
   parameter n = 5; 
   parameter m = 32; 
   
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input    [(n - 1):0] A1, A2, A3;  //instruction ports 
   input    [(m - 1):0] WD; 
   input                WE, clk;     //write enable and clk (both 1 bit)
   output logic   [(m - 1):0] RD1, RD2; 
   reg [(m-1):0] register [(m)];  //32 registers that are 32 bits wide 

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   always @(posedge clk) begin 
      if (WE) begin
         register[A3] <= WD; 
      end

      //hardcoded zero register 
      register[0] = 0; 
      end 

      always @(negedge clk) begin

      $display("v0\t a0\t   s0\t    s1\t    t0\t     ra");
      $display("%h %h %h %h %h %h", register[2], register[4], register[16], register[17], register[8], register[31]);


      end

   assign RD1 = register[A1];
   assign RD2 = register[A2];



endmodule

`endif // EXAMPLE

//components of a reg_file read 1,read 2, read data 1, read data 2, write data, write enable, write 1 
