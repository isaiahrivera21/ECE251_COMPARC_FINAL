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

module ALU_Decoder(funct,ALU_Op,ALU_Control);
   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //
   parameter n = 5; //bits of funct portion of instruction 
   parameter m = 2; //bits of ALU OP 
   parameter l = 4; //bits of ALU control 

   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input    [(n - 1) :0] funct; //ccccccc
   input    [(m - 1) :0] ALU_Op; 
   output reg    [(l - 1) :0] ALU_Control;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   //This always blcok is executed whenever funct or ALU_Op change in value 

   always @(*) begin 
      case ({ALU_Op,funct})
         7'b00xxxxx    : ALU_Control = 4'b0001;  //add
         7'bx1xxxxx    : ALU_Control = 4'b0010;  //subtract
         7'b1x00000    : ALU_Control = 4'b0011;  //add
         7'b1x00001    : ALU_Control = 4'b0100;  //subtract
         7'b1x00010    : ALU_Control = 4'b0101;  //multiply  
         7'b1x00011    : ALU_Control = 4'b0110;  //divide 
         7'b1x00100    : ALU_Control = 4'b0111;  //or 
         7'b1x00101    : ALU_Control = 4'b1000;  //and
         7'b1x00110    : ALU_Control = 4'b1001;  //xor 
         7'b1x00111    : ALU_Control = 4'b1010;  //sll 
         7'b1x01000    : ALU_Control = 4'b1011;  //srl 
         7'b1x01001    : ALU_Control = 4'b1100;  //slt 
         7'bxxxxxxx    : ALU_Control = 4'b1111;
         default:  ALU_Control = 4'b0000;  //not actual default case --> this is a placeolder 

      endcase
   end



endmodule

`endif // EXAMPLE

