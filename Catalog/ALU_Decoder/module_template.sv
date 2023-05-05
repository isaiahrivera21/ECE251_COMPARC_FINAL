////////////////////////////////////////////////////////////////////////////////
//      
//      Module: ALU Decoder
//      Hdl: Verilog
//
//      Module Description: Takes in alu op and the funct code to determine which ALU operation is being executed 
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

//needs to be changed based on our ISA 


`ifndef ALU_DECODER
`define ALU_DECODER

module ALU_Decoder();
   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //
   parameter n = 5; //bits of funct portion of instruction 
   parameter m = 1; //bits of ALU OP 
   parameter l = 2; //bits of ALU control 


   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input    [n:0] funct; 
   input    [m:0] ALU_Op; 
   output   [l:0] ALU_Control

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   //This always blcok is executed whenever funct or ALU_Op change in value 
   always @(funct,ALU_Op) begin 
      case ({ALU_Op,funct})
         8'b00xxxxxx    : ALU_Control = 3'b010;  //add
         8'bx1xxxxxx    : ALU_Control = 3'b110;  //subtract
         8'b1x100000    : ALU_Control = 3'b010;  //add
         8'b1x100010    : ALU_Control = 3'b110;  //subtract
         8'b1x100100    : ALU_Control = 3'b000;  //and 
         8'b1x100101    : ALU_Control = 3'b001;  //or 
         8'b1x101010    : ALU_Control = 3'b111;  //slt (set less than)
         default: //idk what to put here 
      endcase
   end

endmodule

`endif // EXAMPLE

