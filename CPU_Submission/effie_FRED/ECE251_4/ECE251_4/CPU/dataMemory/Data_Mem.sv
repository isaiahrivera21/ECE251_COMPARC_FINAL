////////////////////////////////////////////////////////////////////////////////
//      
//      Module: module_name 
//      Hdl: Verilog
//
//      Module Description: 
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef EXAMPLE
`define EXAMPLE

`timescale 1ns / 1ps

//`include "../Clock/clock.sv"
module Data_Mem(clk,write_enable,addr,writedata,readdata);

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //
   parameter n = 32; 
   parameter m = 5; 

   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input  logic  clk, write_enable;
   input  logic [(n-1):0] addr, writedata;
   output logic [(n-1):0] readdata;



   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   logic [(n-1):0] RAM[63:0];

   assign readdata = RAM[addr[(n-1):2]];
   

   always @(posedge clk) begin
      if (write_enable) RAM[addr[(n-1):2]] <= writedata; 

   end


endmodule

`endif // EXAMPLE

