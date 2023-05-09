`timescale 1ns / 1ps

module instrMem_tb;

   // Inputs
   reg [31:0] pc;

   // Outputs
   wire [31:0] instr;

   // Instantiate the Unit Under Test (UUT)
   instrMem uut (
      .pc(pc),
      .instr(instr)
   );

   initial begin
      // Initialize Inputs
      pc = 32'h00000000;

      // Load instruction memory with test data
      $readmemb("test.txt", uut.allInstr);

      // Test Case 1 - Basic Operation
      // Verify that instr is equal to the instruction at address pc when pc is 0
      pc = 32'h00000000;
      #10;
      if (instr !== uut.allInstr[0]) $error("Test Case 1 Failed");

      // Test Case 2 - Jump Operation
      // Verify that instr is equal to the instruction at address 16 when pc is 64
      pc = 32'h00000040;
      #10;
      if (instr !== uut.allInstr[16]) $error("Test Case 2 Failed");

      // Add additional test cases as necessary

      $display("All test cases passed");
      $finish;
   end

endmodule
