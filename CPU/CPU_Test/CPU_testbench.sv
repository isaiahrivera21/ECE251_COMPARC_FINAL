////////////////////////////////////////////////////////////////////////////////
//      
//      Module Under Test: module_name 
//      Hdl: Verilog
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./CPU.sv" //name of module here
//`include "../Clock/clock.sv"

//CPU(clock,clock_enable,reg_dst,reg_write,alu_src,mem_write,mem_to_reg,alu_ctrl, || alu_out,result);

module CPU_tb;


    //
   // ---
   //
   //reg      clock, clock_enable; 


   reg      reg_dst, reg_write, alu_src, mem_write, mem_to_reg; 
   reg      [3:0] alu_ctrl; 
   reg      [31:0]  pc_plus_4; 
   // reg clk; 


   //reg      [31:0] pc;   



   wire     [31:0] alu_out, result;   
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("CPU.vcd"); // for Makefile, make dump file same as module name
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
   pc_plus_4 = 32'b0; 
   #10;
   $display("%b",pc_plus_4); 
   // #40 $display("%b",clock);
   // #40 $display("%b",clock);
   // #40 $display("%b",clock);
   // #40 $display("%b",clock);
   // #40 $display("%b",clock);
   

   #40 
   //#10 clock_enable <= 1;

   #60;
   $display("%b",pc_plus_4); 




      #10000$finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   CPU uut(.reg_dst(reg_dst), .reg_write(reg_write), .alu_src(alu_src), .mem_write(mem_write), .mem_to_reg(mem_to_reg), .alu_ctrl(alu_ctrl), .alu_out(alu_out), .result(result), .pc_plus_4(pc_plus_4));


endmodule

// `endif // example_tb