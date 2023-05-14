////////////////////////////////////////////////////////////////////////////////
//      
//      Module Under Test: module_name 
//      Hdl: Verilog
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./pc_Counter.sv" //name of module here

module pc_Counter_tb;

   //
   // ---------------- PORT DECLARATIONS ----------------
   //
   reg [31:0] pc_next;  
   wire [31:0] pc;  
   reg clk, rst;    
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("pc_Counter.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //apply input vectors
      initial begin
      clk=0;
         forever #10 clk = ~clk;  
      end 

   initial begin 
      #40 rst = 1;
      pc_next <= 5'h1A;
      #100
      rst = 0;
      #50 
      pc_next <= 5'h1A;
      #10;
      pc_next <= 32'b0;
      #10;
      $finish(1);
end 
   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   pc_Counter uut(.pc(pc), .clk(clk), .rst(rst), .pc_next(pc_next));

endmodule

// `endif // example_tb