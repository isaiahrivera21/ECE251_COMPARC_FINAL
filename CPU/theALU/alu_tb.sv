`timescale 1ns / 1ps
module alu_tb;

  // Inputs
  reg [31:0] rda;
  reg [31:0] rdx;
  reg [3:0] alu_decode;

  // Outputs
  wire [31:0] result;
  wire [31:0] hi; 
  wire [31:0] lo; 
  wire [31:0] remain; 
  wire zero; 


  // Instantiate the unit under test (UUT)
  alu dut (.rda(rda), .rdx(rdx), .alu_decode(alu_decode), .result(result), .Hi(hi), .Lo(lo), .remain(remain), .zero(zero));

  // Initialize testbench
  initial begin
    $dumpfile("alu_tb.vcd"); // Save waveform output to a file
    $dumpvars(0, alu_tb);    // Dump all signals in the hierarchy

    // Test ADD operation
    rda = 5; rdx = 3; alu_decode = 4'b0001;
    #1;
    $display("rda=%d rdx=%d alu_decode=%b result=%d", rda, rdx, alu_decode, result);
    if (result !== 8) $error("Test ADD operation failed");

    // Test SUB operation
    rda = 5; rdx = 3; alu_decode = 4'b0010;
    #1;
    $display("rda=%d rdx=%d alu_decode=%b result=%d", rda, rdx, alu_decode, result);
    if (result !== 2) $error("Test SUB operation failed");

    // Test MUL operation
    rda = 5; rdx = 3; alu_decode = 4'b0101;
    #1;
    $display("rda=%d rdx=%d alu_decode=%b result=%d", rda, rdx, alu_decode, lo);
    if (lo !== 15) $error("Test MUL operation failed");

    // Test DIV operation
    rda = 10; rdx = 2; alu_decode = 4'b00110;
    #1;
    $display("rda=%d rdx=%d alu_decode=%b result=%d", rda, rdx, alu_decode, result);
    if (result !== 5) $error("Test DIV operation failed");

    // Test OR operation
    rda = 32'h55; 
    rdx = 32'hAA; 
    alu_decode = 4'b111;
    #1;
    $display("rda=%h rdx=%h alu_decode=%b result=%h", rda, rdx, alu_decode, result);
    if (result !== 32'hFF) $error("Test OR operation failed");

    // Test AND operation
    rda = 32'h55; rdx = 32'hAA; alu_decode = 4'b1000;
    #1;
    $display("rda=%h rdx=%h alu_decode=%b result=%h", rda, rdx, alu_decode, result);
    if (result !== 0) $error("Test AND operation failed");

    // Test XOR operation
     rda = 32'h55; rdx = 32'hAA; alu_decode = 4'b1001;
    #1;
    $display("rda=%h rdx=%h alu_decode=%b result=%h", rda, rdx, alu_decode, result);
    if (result !== 32'hFF) $error("Test XOR operation failed");

    // Test shift left sll operation
    rda = 32'h80000000;
    rdx = 5'h10;
    alu_decode = 4'b1010;
    #10;
    $display("rda: %h, rdx: %h, alu_decode: %b, result: %h", rda, rdx, alu_decode, result);
    if (result === 32'h00000000) begin
      $display("Shift left logical (SLL) test passed!");
    end else begin
      $display("Shift left logical (SLL) test failed!");
    end
    #10;
 // Test slt operation
    rda = 32'h00000010;
    rdx = 32'h00000001;
    alu_decode = 4'b1100; // slt
    #10; // wait 10 time units
    if (result !== 0) begin  $display("Test failed for slt operation");end 
    if  (result == 0) begin  $display("Test case passed for slt operation"); end 
  
    // Test srl operation
    rda = 32'h00F0F0F0;
    rdx = 5'h5;
    alu_decode = 4'b1011; // srl
    #10; // wait 10 time units
    if (result == 32'h00078787) $display("Test1 success for srl operation");
        $display("rda=%h rdx=%h alu_decode=%b result=%h", rda, rdx, alu_decode, result);

    // Test srl with rdx=1
    rda = 32'h12345678; 
    rdx = 5'h1;
    alu_decode = 4'b1011; // srl
    #10; // wait 10 time units
    if (result == 32'h091A2B3C) $display("Test2 succces for srl with rdx=1");
    $display("rda=%h rdx=%h alu_decode=%b result=%h", rda, rdx, alu_decode, result);

    $finish;
  end

endmodule

