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

`ifndef DATAPATH
`define DATAPATH

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
`include "../adder/Adder.sv"
`include "../Control_Unit/Control_Unit.sv"

`timescale 1ns/1ps

//need a text file to put in for instruction memory 
module Datapath(rst, alu_out,result);

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //

   reg CLK; 
   logic [(n-1):0] pc_next; 


   initial begin

      CLK <= 0;
      // pc_next = 32'b0;
      //pc_Counter program_count(pc_next,CLK,pc);  

      forever

      begin

      //#40;
      #500;

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
   //input logic [(n-1): 0]  pc_next;

    
   logic    reg_dst; 
   logic    reg_write; 
   logic    alu_src; 
   logic    branch; 
   logic    mem_write; 
   logic    mem_to_reg; 
   logic    jump;
   logic    jal;
   logic    jr; 
   logic [3:0]    alu_ctrl; 



   


   logic   [(n-1): 0] pc;
   logic   [(n-1): 0] pc_init;  
   //logic   [(n-1): 0]  pc_plus_4; 
   logic   [(n-1): 0]  instr;
   logic   [(n-1): 0]  signimm; 
   logic   [(n-1): 0]  srcA; 
   logic   [(n-1): 0]  read_data_2;
   logic   [(m-1): 0]  write_reg; 
   logic   [(n-1): 0]  srcB; 
   logic   [(n-1): 0]  data_mem_out;
   logic   [(n-1): 0]  pc_plus_4;

   //logic   [(n-1): 0]  pc_next; 
   //logic   [(n-1): 0]  pc_next;

   //--------------------------------------(beq logics)---------------------------------//
   logic pc_src; 
   logic zero_flag; 
   logic [(n-1): 0] pc_branch; 
   logic [(n-1): 0] shift_signimm; 
   
   //--------------------------------------(jump logic)---------------------------------//
   logic [25:0] jump_to_addr; 
   logic [31:0] next_pc_rslt;

   //--------------------------------------(jal logic)---------------------------------//
   logic [31:0] non_jump_rslt; 
   logic [4:0]  register_val; 

   //jr logic 
   logic [31:0] jump_pc_rslt; 








   output logic [(n-1): 0] alu_out; 
   output logic [(n-1): 0] hi,lo, remain; //not sure what to do for these in the context of the cpu  
   output logic [(n-1): 0] result; 
   //logic output [(n-1): 0] pc; 
   //pc stuff should be logic values. pc_next should be logic and not an input

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   // clock clk(1'b1,clock); 
   //assign pc_init = 32'b0;
   pc_Counter program_count(pc_next,CLK,rst,pc);      
                   //??? pc_plus_4 needs to now be equal to pc_n
   //pc_Counter program_count1(pc_plus_4,CLK,pc);  
   pcAdder pc_plus4(pc,pc_plus_4);
   //assign pc_next = pc_plus_4;
   instrMem instr_mem(pc,instr); 


   //---------------------------------------(CONTROL_UNIT)-------------------------------//
   Control_Unit control_unit(instr[31:26],instr[5:0],reg_write,reg_dst,alu_src,branch,mem_write,mem_to_reg,jump,jal,jr,alu_ctrl); 

   pcMux reg_dst_mux(instr[20:16], instr[15:11], reg_dst,write_reg); //NOT 32 need to change parameter //need to swap for 
   defparam reg_dst_mux.n = 5; 
   Reg_File register_file(instr[25:21], instr[20:16], register_val, result, reg_write, CLK, srcA, read_data_2); 
   Sign_Extend sign_extend(instr[15:0], signimm); 
   pcMux alu_src_mux(read_data_2,signimm,alu_src,srcB);
   alu alu(alu_ctrl, srcA, srcB, alu_out,hi,lo,remain, zero_flag); 
   Data_Mem data_mem(CLK, mem_write, alu_out, read_data_2,data_mem_out); 
   pcMux memtoreg_mux(alu_out, data_mem_out, mem_to_reg,non_jump_rslt); 
   //pcMux pc_add4 (pc_plus_4,32'b0,0,pc_next); 
   // pcMux pc_ad(pc_plus_4, pc, 1'b0, pc_next); 

   //next up ---> THE CONTROL LINES 






   //--------------------------------------(BEQ path)---------------------------------//

   assign pc_src = ( 0 || zero_flag) & (branch); 
   assign shift_signimm = signimm << 2; //might need to be a function, might need to be shifted the opposite way. 
   Adder pc_branch_addr(shift_signimm, pc_plus_4, pc_branch); 
   pcMux next_pcmux(pc_plus_4, pc_branch, pc_src,next_pc_rslt);

   //---------------------------(J INSTRUCTION PATH)--------------------------------//
   assign jump_to_addr = instr[25:0] << 2; 
   pcMux jump_or_plus4 (next_pc_rslt, {pc_plus_4[31:28],jump_to_addr}, jump, jump_pc_rslt); 

   //program idea: add immeadiates for a punch of registers. Have it jump to a certain one

   //JAL 
   pcMux result_mux(non_jump_rslt, pc_plus_4, jal, result); 
   pcMux write_to_ra(write_reg,5'b11111,jal,register_val); 
   defparam write_to_ra.n = 5; 


   //JR 
   pcMux instr_mux(jump_pc_rslt,srcA,jr,pc_next); 


   



//idea make seperate thing to play around with pc adder and pcCounter 


endmodule

`endif // EXAMPLE

