////////////////////////////////////////////////////////////////////////////////
//      
//      Module: CPU 
//      Hdl: Verilog
//
//      Module Description: 
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef CPU
`define CPU

`include "../ALU_Decoder/ALU_Decoder.sv"
`include "../instructionMemory/instrMem.sv"
`include "../pcadder/pcAdder.sv"
`include "../pcMux/pcMux.sv"
`include "../Program_Counter/pc_Counter.sv"
`include "../Reg_File/Reg_File.sv"
`include "../Sign_Extender/Sign_Extend.sv"
`include "../theALU/alu.sv"
`include "../Clock/clock.sv"
`include "../dataMemory/Data_Mem.sv"


//need a text file to put in for instruction memory 
module CPU(pc_next, reg_dst,reg_write,alu_src,mem_write,mem_to_reg, alu_ctrl, alu_out,result);

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //

   reg CLK; 

   initial begin

      CLK <= 0;

      forever

      begin

      #40;

      CLK = ~CLK;

      end

      end
   parameter n = 32; //CPU is 32 bits 
   parameter m = 5; 

   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   //input logic    [(n-1): 0] pc_n; //adress our text starts at 
   input logic    rst; 
   // input reg      clock;  //might need to a logic 
   // input logic    clock_enable; 

   //for now w/ no control unit we will make the contorl inputs input logics to test it out 
   input logic [(n-1): 0]  pc_next; 
   input logic    reg_dst; 
   input logic    reg_write; 
   input logic    alu_src; 
   input logic    mem_write; 
   input logic    mem_to_reg; 

   input logic [3:0]    alu_ctrl; 

   


   logic   [(n-1): 0]  pc; 
   //logic   [(n-1): 0]  pc_plus_4; 
   logic   [(n-1): 0]  instr;
   logic   [(n-1): 0]  signimm; 
   logic   [(n-1): 0]  srcA; 
   logic   [(n-1): 0]  read_data_2;
   logic   [(m-1): 0]  write_reg; 
   logic   [(n-1): 0]  srcB; 
   logic   [(n-1): 0]  data_mem_out;
   logic   [(n-1): 0]  pc_plus_4;

   output logic [(n-1): 0] alu_out; 
   output logic [(n-1): 0] hi,lo, remain; //not sure what to do for these in the context of the cpu  
   output logic [(n-1): 0] result; 
   //logic output [(n-1): 0] pc; 

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   // clock clk(1'b1,clock); 
   pc_Counter program_count(pc_next,CLK,pc);                      //??? pc_plus_4 needs to now be equal to pc_n
   pcAdder pc_plus4(pc,rst,pc_plus_4); 
   instrMem instr_mem(pc,instr); 
   pcMux reg_dst_mux(instr[20:16], instr[15:11],reg_dst,write_reg); //NOT 32 need to change parameter 
   defparam reg_dst_mux.n = 5; 
   Reg_File register_file(instr[25:21], instr[20:16], write_reg, result, reg_write, CLK, srcA, read_data_2); 
   Sign_Extend sign_extend(instr[15:0], signimm); 
   pcMux alu_src_mux(read_data_2,signimm,alu_src,srcB);
   alu alu(alu_ctrl, srcA, srcB, alu_out,hi,lo,remain); 
   Data_Mem data_mem(CLK, mem_write, alu_out, read_data_2,data_mem_out); 
   pcMux memtoreg_mux(alu_out, data_mem_out, mem_to_reg,result); //mem to reg mux SUS --> outputs B but it should be A 



endmodule

`endif // EXAMPLE

