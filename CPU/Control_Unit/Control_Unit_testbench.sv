////////////////////////////////////////////////////////////////////////////////
//      
//      Module Under Test: module_name 
//      Hdl: Verilog
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./Control_Unit.sv" //name of module here

module Control_Unit_tb;

    //
   // ---------------- PORT DECLARATIONS ----------------
   //
   reg  [5:0] opcode, funct;  
   wire regWrite, regDesination, aluSource, branch, memWrite, memToReg, jump, jal, jr; 
   wire [3:0] alu_ctrl;  
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("Control_Unit.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //apply input vectors
   initial
   begin: apply_stimulus
      #50; 
      opcode = 6'b000111; 
      funct  = 6'b000100; 

      #1000;

      $display("opcode: %b     funct: %b      alu_ctrl:%b", opcode,funct,alu_ctrl);
      $display(" regWrite: %b     regDesination: %b      aluSource: %b     branch: %b     memWrite: %b      memToReg: %b      jump: %b       jal: %b     jr: %b",regWrite, regDesination, aluSource, branch, memWrite, memToReg, jump, jal, jr); 


      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   Control_Unit uut(.opcode(opcode), .funct(funct), .regWrite(regWrite), .regDesination(regDesination), .aluSource(aluSource), .branch(branch), .memWrite(memWrite), .memToReg(memToReg), .jump(jump), .jal(jal), .jr(jr), .alu_ctrl(alu_ctrl));
   //Control_Unit(opcode, funct, regWrite, regDesination, aluSource, branch, memWrite, memToReg, jump, jal, jr, alu_ctrl);
endmodule

// `endif // example_tb