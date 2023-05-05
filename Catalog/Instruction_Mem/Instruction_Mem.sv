////////////////////////////////////////////////////////////////////////////////
//      
//      Module: Instruction Memeory  
//      Hdl: Verilog
//
//      Module Description: Extracts an instruction from a memeory adress 
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef INSTRUCTION_MEM
`define INSTRUCTION_MEM

module Instruction_Mem();

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //
   parameter n = 32; //number of rom registers available  
   parameter m = 32; //how many bits a register can hold 
   
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input    [(m - 1):0] PC;  //Program Counter --> adress  
   // input                WE, clk;     //write enable and clk (both 1 bit)
   output   [(m - 1):0] instr;

  // wire addr = PC
    
   reg [m:0] rom [n];  //32 registers that are 32 bits wide, these are n ROM registers (R)ead (O)nly (M)emory can have. n registers --> n lines of instructions 


   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   assign instr = rom[ ((to_integer(unsigned(PC)) - 4194304)/4)] //produces a base 10 number that correlates to an addr slot 

   //Side Q's: how to we put instructions into instr mem 
         //    PC???? how does pc get input as an adress look into how rom[adr] works!!!! 
         //    how big is a adress 32 bits  
endmodule

`endif // EXAMPLE

//components of a reg_file read 1,read 2, read data 1, read data 2, write data, write enable, write 1 
// idea need to make an instruction which is X bits into a 5 bit???? (Decoder Shenanagins) 