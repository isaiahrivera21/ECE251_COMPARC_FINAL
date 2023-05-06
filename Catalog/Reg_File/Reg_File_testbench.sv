////////////////////////////////////////////////////////////////////////////////
//      
//      Module Under Test: module_name 
//      Hdl: Verilog
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./Reg_File.sv" //name of module here

module eReg_File_tb;

    //
   // ---------------- PORT DECLARATIONS ----------------
   //
   reg   [31:0] A1, A2, A3;   
   reg          WE, clk; 
   wire  [31:0] RD1, RD2, WD;     
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("Reg_File.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //apply input vectors
   initial
   begin: apply_stimulus
      reg[3:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 8; invect = invect + 1)
      begin
         // {a, b, cin} = invect [3:0];
         // #10 $display ("abcin = %b, cout = %b, sum = %b", {a, b, cin}, cout, sum);
         {a} = invect [3:0];
         {b} = ~invect [3:0];
         #10 $display("a=%b, b=%b, c=%b", a, b, c);
      end
      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   Reg_File uut(.A(a), .B(b), .C(c));

endmodule

// `endif // example_tb