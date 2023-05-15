`timescale 1ns / 1ps

module pcMux_tb;

   // Inputs
   parameter n =32; 
   parameter m = 5; 
   reg pc_sel;
   reg [(n-1):0] pcAddr;
   reg [(n-1):0] jAddr;

   // Outputs
   wire [(n-1):0] true_pc;
   // parameter n = 32;

   // Instantiate the Unit Under Test (UUT)
   pcMux uut (.A(jAddr), .B(pcAddr), .Sel(pc_sel), .Y(true_pc));
   defparam uut.n = 5; 

   initial begin
      // Initialize Inputs
      pc_sel = 0;
      pcAddr = 32'h00000000;
      jAddr = 32'h00000004;

      // Test Case 1 - Basic Operation
      // Verify that true_pc is pcAddr when pc_sel is 0
      pc_sel = 0;
      pcAddr = 32'h00000000;
      jAddr = 32'h00000004;
      #10;
      if (true_pc !== 32'h00000004) $error("Test Case 1 Failed");

      // Test Case 2 - Jump Operation
      // Verify that true_pc is jAddr when pc_sel is 1
      pc_sel = 1;
      pcAddr = 32'h00000000;
      jAddr = 32'h00000004;
      #10;
      if (true_pc !== 32'h00000000) $error("Test Case 2 Failed");

      // Add additional test cases as necessary

      $display("All test cases passed");
      $finish;
   end

endmodule
