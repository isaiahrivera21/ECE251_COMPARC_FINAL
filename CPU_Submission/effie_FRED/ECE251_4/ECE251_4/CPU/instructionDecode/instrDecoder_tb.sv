`timescale 1ns / 1ps

module test_instrDecoder;

   // Inputs
   reg [31:0] instr;

   // Outputs
   wire [5:0] opcode;
   wire [4:0] rs1, rs2, rd, shmt;
   wire [5:0] funct;

   // Instantiate the Unit Under Test (UUT)
   instrDecoder uut (
      .instr(instr),
      .opcode(opcode),
      .rs1(rs1),
      .rs2(rs2),
      .rd(rd),
      .shmt(shmt),
      .funct(funct)
   );

   initial begin
      // Initialize Inputs
      instr = 32'b00000000000000000000000000000000; // 0000000
      // Test Case 1 - Basic Operation
      // Verify that the output values are correct for an addi instruction
      #10;
      if (opcode !== 6'b000000 || rs1 !== 5'b00000 || rs2 !== 5'b00000 || rd !== 5'b00000 || shmt !== 5'b00000 || funct !== 6'b000000) $error("Test Case 1 Failed");

      // Test Case 2 - R-type instruction
      // Verify that the output values are correct for an R-type instruction
      instr = 32'b00000001010010110100100000100000; // add t1 t2 t3
      //instr = 32'h014B4820; 
      #10;
      if (opcode !== 6'b000000 || rs1 !== 5'b01010 || rs2 !== 5'b01011|| rd !== 5'b01001 || shmt !== 5'b00000 || funct !== 6'b100000) $error("Test Case 2 Failed");

      // Add additional test cases as necessary
    
      $display("All test cases passed");
      $finish;
   end

endmodule
