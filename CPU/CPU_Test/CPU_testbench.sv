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

//CPU(clock,clock_enable,reg_dst,reg_write,alu_src,mem_write,mem_to_reg,alu_ctrl, || alu_out,result);

module CPU_tb;

    //
   // ---------------- PORT DECLARATIONS ----------------
   //
  
   reg      clock, clock_enable, reg_dst, reg_write, alu_src, mem_write, mem_to_reg; 
   reg      [3:0] alu_ctrl; 
   reg      [31:0]  pc_plus_4; 
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

   //apply input vectors
   initial
   begin: apply_stimulus
   pc_plus_4 = 32'b0; 
   #10;
   $display("%b",pc_plus_4); 

   #60;
   $display("%b",pc_plus_4); 




      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   CPU uut(.clock(clock), .clock_enable(clock_enable), .reg_dst(reg_dst), .reg_write(reg_write), .alu_src(alu_src), .mem_write(mem_write), .mem_to_reg(mem_to_reg), .alu_ctrl(alu_ctrl), .alu_out(alu_out), .result(result), .pc_plus_4(pc_plus_4));


endmodule

// `endif // example_tb