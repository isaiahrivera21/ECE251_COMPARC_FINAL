////////////////////////////////////////////////////////////////////////////////
//      
//      Module Under Test: module_name 
//      Hdl: Verilog
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

`include "./Datapath.sv" //name of module here
//`include "../Clock/clock.sv"

//CPU(clock,clock_enable,reg_dst,reg_write,alu_src,mem_write,mem_to_reg,alu_ctrl, || alu_out,result);

module Datapath_tb;

   //reg      reg_dst, reg_write, alu_src, branch, mem_write, mem_to_reg; 
   //reg      [3:0] alu_ctrl; 
   reg rst; 
   // reg      [31:0]  pc_n; 
   // reg clk; 
   //reg      [31:0] pc;   
   wire     [31:0] alu_out, result;   


   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("Datapath.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //   initial 
   //    begin
   //    clk = 0;
   //       forever #10 clk = ~clk;  
   //    end 

   //apply input vectors
   initial
   begin: apply_stimulus
   //#10 clock_enable <= 0;
   //#100 pc_n <= 32'b0; 

   //#10 clock_enable <= 1;
   //$display("%b",pc_n); 

   #1500 rst <= 1;
   #500
   rst <= 0;
   #195     
   
      #900000
   //$display("Register: %b     Data in Reg: %b", A3, register[A3]);

   
      
      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   Datapath uut(.rst(rst), .alu_out(alu_out), .result(result));

   //timing issue: pins need to change the moment the instruction starts. if at an akward time it throws everything off
endmodule

// `endif // example_tb
