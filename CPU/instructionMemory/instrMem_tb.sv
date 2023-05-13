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

   initial
     begin
        $dumpfile("instrMem.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   initial begin
      // Initialize Inputs
      pc = 32'h00000000; 

      // Load instruction memory with test data
      $readmemb("addi_test.txt", uut.allInstr);

      // Test Case 1 - Basic Operation
      // Verify that instr is equal to the instruction at address pc when pc is 0
      pc = 32'h00000000;
      #10;
      if (instr !== uut.allInstr[0]) $error("Test Case 1 Failed");
      $display("ADDR:    %h", pc);
      $display("INSTR:   %b", instr);

      pc = 32'h00000004; 
      #40

      $display("ADDR:      %h", pc);
      $display("ADDR:      %h", pc>>2); 
      $display("INSTR:     %b", instr);
      $display("allInstr:  %b", uut.allInstr[pc>>2]);
      if (instr !== uut.allInstr[1]) $error("Test Case 1.5 Failed");



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
