////////////////////////////////////////////////////////////////////////////////
//      
//      Module Under Test: module_name 
//      Hdl: Verilog
//
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./Sign_Extend.sv" //name of module here

module example_tb;

    //
   // ---------------- PORT DECLARATIONS ----------------
   //
   reg   [15:0] A;   
   wire  [31:0] B;     
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("Sign_Extend.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //apply input vectors
   initial
   begin: apply_stimulus
      #10 A = 16'b0100011111101010; //16 bit number to be sign extended 
      #40 
      // $display("16_bit_number=%b, 32_bit_number=%b" A, B); 
      $display("MSB = %b    16_bit: %b    32_bit=%b",A[15], A,B); 
      // $finish;
   end
   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   Sign_Extend uut(.A(A), .B(B)); 

endmodule
// `endif // example_tb
//TEST: take a 16 bit number and extend it to 32 