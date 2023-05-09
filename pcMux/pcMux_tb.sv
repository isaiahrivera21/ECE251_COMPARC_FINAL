`timescale 1ns / 1ps

module pcMux_tb;

   // Inputs
   reg pc_sel;
   reg [31:0] pcAddr;
   reg [31:0] jAddr;

   // Outputs
   wire [31:0] true_pc;

   // Instantiate the Unit Under Test (UUT)
   pcMux uut (
      .pcAddr(pcAddr),
      .jAddr(jAddr),
      .pc_sel(pc_sel),
      .true_pc(true_pc)
   );

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
      if (true_pc !== 32'h00000000) $error("Test Case 1 Failed");

      // Test Case 2 - Jump Operation
      // Verify that true_pc is jAddr when pc_sel is 1
      pc_sel = 1;
      pcAddr = 32'h00000000;
      jAddr = 32'h00000004;
      #10;
      if (true_pc !== 32'h00000004) $error("Test Case 2 Failed");

      // Add additional test cases as necessary

      $display("All test cases passed");
      $finish;
   end

endmodule
