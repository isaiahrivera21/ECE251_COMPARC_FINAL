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

`ifndef CONTROL_UNIT
`define CONTROL_UNIT

`include "../theCPUcontrol/CPUcontrol.sv"
`include "../ALU_Decoder/ALU_Decoder.sv"

module Control_Unit(opcode, funct, regWrite, regDesination, aluSource, branch, memWrite, memToReg, jump, jal, jr, alu_ctrl);

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //
   parameter n = 32; 
   parameter m = 6; 

   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input logic [(m-1) : 0] opcode, funct; 

   logic [1:0] alu_op; 

   output logic regWrite, regDesination, aluSource, branch, memWrite, memToReg, jump, jal, jr; 
   output logic [3:0] alu_ctrl; 

   CPUcontrol main_decoder(opcode,alu_op,regWrite, regDesination, aluSource, branch, memWrite, memToReg, jump, jal, jr);
   ALU_Decoder alu_decoder(funct,alu_op,alu_ctrl);

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //


endmodule

`endif // EXAMPLE

