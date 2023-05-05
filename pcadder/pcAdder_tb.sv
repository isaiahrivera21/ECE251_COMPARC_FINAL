`timescale 1ns / 1ps

//`include "pcAdder.sv"

module pcAdder_tb;

   // Inputs
   reg [31:0] pc;
   reg rst;

   // Outputs
   wire [31:0] pcAddr;

   // Instantiate the Unit Under Test (UUT)
   pcAdder uut (
      .pc(pc),
      .rst(rst),
      .pcAddr(pcAddr)
   );

   initial begin
      // Initialize Inputs
      pc = 32'h00000000;
      rst = 0;

      // Wait for 100 ns for global reset to finish
      #100;

      // Test Case 1 - Basic Operation
      // Verify that pcAddr is pc+4 when rst is low
      rst = 0;
      pc = 32'h00000000;
      #10;
      if (pcAddr !== 32'h00000004) $error("Test Case 1 Failed");

      // Test Case 2 - Reset Operation
      // Verify that pcAddr is 0 when rst is high
      rst = 1;
      pc = 32'h00000012;
      #10;
      if (pcAddr !== 32'h00000016) $error("Test Case 2 Failed");

      // Test Case 1 - Basic Operation
      // Verify that pcAddr is pc+4 when rst is low
      rst = 0;
      pc = 32'h00010000;
      #10;
      if (pcAddr !== 32'h00010004) $error("Test Case 3 Failed");

      // Test Case 2 - Reset Operation
      // Verify that pcAddr is 0 when rst is high
      rst = 0;
      pc = 32'h00000008;
      #10;
      if (pcAddr !== 32'h0000000c) $error("Test Case 4 Failed");

      // Add additional test cases as necessary

      $display("All test cases passed");
      $finish;
   end

endmodule
