////////////////////////////////////////////////////////////////////////////////
//      
//      Module: module_name 
//      Hdl: Verilog
//
//      Module Description: 
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef CPU
`define CPU

`include "../Datapath/Datapath.sv"
`include "../Control_Unit/Control_Unit.sv"

module CPU();

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //
   

   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input logic rst; 
   




   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   Control_Unit control_unit(opcode, funct, regWrite, regDesination, aluSource, branch, memWrite, memToReg, jump, jal, jr, alu_ctrl); 
   Datapath datapath(rst, reg_dst,reg_write,alu_src, branch, mem_write,mem_to_reg, alu_ctrl, alu_out,result);



endmodule

`endif // EXAMPLE

