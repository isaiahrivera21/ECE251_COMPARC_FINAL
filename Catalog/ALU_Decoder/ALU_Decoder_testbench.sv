////////////////////////////////////////////////////////////////////////////////
//      
//      Module Under Test: module_name 
//      Hdl: Verilog
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./ALU_Decoder.sv" //name of module here

module ALU_Decoder_tb;

    //
   // ---------------- PORT DECLARATIONS ----------------
   //
   reg   [4:0] funct; 
   reg   [1:0] ALU_Op;   
   wire  [3:0] ALU_Control;  

   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //

   initial
     begin
        $dumpfile("ALU_Decoder.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //apply input vectors

   initial
   begin: apply_stimulus

      //a random funct code from our ISA.
      //Lets see if it outputs the right operation 
      #10 funct = 5'b00101; 
      #10 ALU_Op = 2'b1x; 
      #40 
      $display(" code = %b, funct = %b    ALU_Op = %b   ALU_Control = %b", {ALU_Op, funct}, funct, ALU_Op,ALU_Control); 

      // $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   ALU_Decoder uut(.funct(funct), .ALU_Op(ALU_Op), .ALU_Control(ALU_Control));

endmodule

// `endif // example_tb

