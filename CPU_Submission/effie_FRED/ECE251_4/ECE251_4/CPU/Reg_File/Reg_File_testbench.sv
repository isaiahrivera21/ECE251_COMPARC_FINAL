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
   reg   [4:0] A1, A2, A3;   
   reg   [31:0] WD;
   reg          WE, clk; 
   wire  [31:0] RD1, RD2;     
   
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

   initial 
      begin
      clk = 0;
         forever #10 clk = ~clk;  
      end 

   //apply input vectors
   initial
   begin: apply_stimulus
      //lets try writtin to a register
      WE = 1;  //allowed to write to a register 
      #100;
      A3 = 5'b11010; //write to reg 1 
      //A3 = 5'b0000;
      #100;
      WD = 10001111111110101111001110111101; 
      #100; 
      WE = 0; 
      #10; 
      A1 = 1'b0; //read to reg 1 
      #100;
      $display("Register: %b     Data in Reg: %b", A1, RD1);
      #100;
      A2 = 5'b11010; 
      #100;
      $display("Register: %b     Data in Reg: %b", A2, RD2);
      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   Reg_File uut(.A1(A1), .A2(A2), .A3(A3), .WD(WD), .WE(WE), .clk(clk), .RD1(RD1), .RD2(RD2));

endmodule

// `endif // example_tb