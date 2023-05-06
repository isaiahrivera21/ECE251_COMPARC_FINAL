////////////////////////////////////////////////////////////////////////////////
//      
//      Module: Sign Extender 
//      Hdl: Verilog
//
//      Module Description: Takes the most signifigant bit and extends/ copies until you reach your new desired number of bits 
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef SIGN_EXTEND
`define SIGN_EXTEND

module Sign_Extend(A,B);

   //
   // ---------------- PARAMETER DECLARATIONS ----------------
   //

   parameter n = 32;
   parameter m = 16; 

   //
   // ---------------- PORT DEFINITIONS ----------------
   //

   input    [(m - 1):0] A; 
   output   [(n - 1):0] B;   

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   // assign bit m to bits [(m + 1) : n]
   // bits 
   assign B[(m-1):0]  =  A[(m-1):0]; 
   assign B[(n-1):m]  = {{(n - m) {A[(m-1)]}}}; 
   


endmodule

`endif // EXAMPLE

// m < n 
// Input [m:0] 
// Output [n:0]
// need to fill out (n - m) slots 
// assign bit m to bits [(m + 1) : n]
// gate: just OR bit m with bits m + 1 to n    