`timescale 1ns / 1ps

//`include "pcAdder.sv"

module Adder_tb;

   // Inputs
   reg [31:0] A;
   reg [31:0] B; 
   reg rst;

   // Outputs
   wire [31:0] out;

   // Instantiate the Unit Under Test (UUT)
   Adder uut (
      .A(A),
      .B(B),
      .out(out)
   );

   initial begin
      // Initialize Inputs
      #100 
      A = 32'b01010111000011010010011000011100;
      B = 32'b0;
      #50

      $display("RESULT: %h", out); 

      

      // Add additional test cases as necessary

      $finish;
   end

endmodule
