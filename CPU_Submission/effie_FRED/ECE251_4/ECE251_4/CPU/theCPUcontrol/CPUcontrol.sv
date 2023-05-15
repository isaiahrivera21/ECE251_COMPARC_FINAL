`timescale 1ns / 1ps

module CPUcontrol(
      input [5:0] opcode,
      output reg[1:0] aluOP,
      output reg regWrite, regDesination, aluSource, Branch, memWrite, memToReg, jump, jal, jr
    );

always @(opcode)
begin
 case(opcode) 
 6'b000000:  // R type
   begin

    regWrite        = 1'b1;
    regDesination   = 1'b1;
    aluSource       = 1'b0;
    Branch          = 1'b0;
    memWrite        = 1'b0;
    memToReg        = 1'b0;
    aluOP           = 2'b11;
    jump            = 1'b0;
    jal             = 1'b0; 
    jr              = 1'b0; 
   end

 6'b000001:  // BEQ
   begin
    regWrite        = 1'b0;
    regDesination   = 1'b0; //don't care
    aluSource       = 1'b0;
    Branch          = 1'b1;
    memWrite        = 1'b0;
    memToReg        = 1'b0; //don't care
    aluOP           = 2'b01;
    jump            = 1'b0;
    jal             = 1'b0; 
    jr              = 1'b0; 
   end

 6'b000010:  // lw
   begin
    regWrite        = 1'b1;
    regDesination   = 1'b0;
    aluSource       = 1'b1;
    Branch          = 1'b0;
    memWrite        = 1'b0;
    memToReg        = 1'b1;
    aluOP           = 2'b00;
    jump            = 1'b0;
    jal             = 1'b0; 
    jr              = 1'b0; 
   end

 6'b000011:  // sw
   begin
    regWrite        = 1'b0;
    regDesination   = 1'b0; //don't care
    aluSource       = 1'b1;
    Branch          = 1'b0;
    memWrite        = 1'b1;
    memToReg        = 1'b0; //don't care
    aluOP           = 2'b00;
    jump            = 1'b0;
    jal             = 1'b0; 
    jr              = 1'b0;   
   end
 6'b000100:  //ADDI
   begin
    regWrite        = 1'b1;
    regDesination   = 1'b0;
    aluSource       = 1'b1;
    Branch          = 1'b0;
    memWrite        = 1'b0;
    memToReg        = 1'b0;
    aluOP           = 2'b00;
    jump            = 1'b0;
    jal             = 1'b0; 
    jr              = 1'b0; 
   end

 6'b000101:  // ANDI
   begin
    regWrite        = 1'b1;
    regDesination   = 1'b0;
    aluSource       = 1'b1;
    Branch          = 1'b0;
    memWrite        = 1'b0;
    memToReg        = 1'b0;
    aluOP           = 2'b10; //don't care
    jump            = 1'b0;
    jal             = 1'b0; 
    jr              = 1'b0; 
   end

 6'b000110:  // XORI
   begin
    regWrite        = 1'b1;
    regDesination   = 1'b1;
    aluSource       = 1'b1;
    Branch          = 1'b0;
    memWrite        = 1'b0;
    memToReg        = 1'b0;
    aluOP           = 2'b10;  //don't care
    jump            = 1'b0;
    jal             = 1'b0; 
    jr              = 1'b0;    
   end
 6'b000111:  // SLTI
   begin
    regWrite        = 1'b1;
    regDesination   = 1'b0;
    aluSource       = 1'b1;
    Branch          = 1'b0;
    memWrite        = 1'b0;
    memToReg        = 1'b0;
    aluOP           = 2'b10;
    jump            = 1'b0;
    jal             = 1'b0; 
    jr              = 1'b0;   
   end
 6'b001000:  // JUMP
   begin
    regWrite        = 1'b0;
    regDesination   = 1'b0; // don't care
    aluSource       = 1'b0; // don't care
    Branch          = 1'b0; //don't care
    memWrite        = 1'b0;
    memToReg        = 1'b0; //don't care
    aluOP           = 2'b00; //don't care
    jump            = 1'b1;
    jal             = 1'b0; 
    jr              = 1'b0;   
   end
 6'b001001:  // JAL
   begin
    regWrite        = 1'b1;
    regDesination   = 1'b0;
    aluSource       = 1'b0;
    Branch          = 1'b0;
    memWrite        = 1'b0;
    memToReg        = 1'b0;
    aluOP           = 2'b00;
    jump            = 1'b1;
    jal             = 1'b1; 
    jr              = 1'b0;  //alot of dc here 
   end
                  ///////////////////////////////////// 

  6'b001010:  // JR
   begin
    regWrite        = 1'b0;
    regDesination   = 1'b0;
    aluSource       = 1'b0;
    Branch          = 1'b0;
    memWrite        = 1'b0;
    memToReg        = 1'b0;
    aluOP           = 2'b00;
    jump            = 1'b0;
    jal             = 1'b0; 
    jr              = 1'b1;  //alot of dc here 
   end 


//  6'b001011:  // JR
//    begin
//     regDesination = 1'b0;
//     aluSource = 1'b0;
//     memToReg = 1'b0;
//     regWrite = 1'b0;
//     //mem_read = 1'b0;
//     memWrite = 1'b0;
//    // beq = 1'b1;
//     //bne = 1'b0;
//     aluOP = 2'b01;
//     jump = 1'b0;   
//    end

//  4'b1100:  // BNE
//    begin
//     // regDesination = 1'b0;
//     // aluSource = 1'b0;
//     // memToReg = 1'b0;
//     // regWrite = 1'b0;
//     // //mem_read = 1'b0;
//     // memWrite = 1'b0;
//     // //beq = 1'b0;
//     // //bne = 1'b1;
//     // aluOP = 2'b01;
//     // jump = 1'b0;   
//    end

//  4'b1101:  // BEQI
//    begin
//     // regDesination = 1'b0;
//     // aluSource = 1'b0;
//     // memToReg = 1'b0;
//     // regWrite = 1'b0;
//     // //mem_read = 1'b0;
//     // memWrite = 1'b0;
//     // //beq = 1'b0;
//     // //bne = 1'b0;
//     // aluOP = 2'b00;
//     // jump = 1'b1;   
//    end   

// 4'b1110:  // BENI
//    begin
//     // regDesination = 1'b0;
//     // aluSource = 1'b0;
//     // memToReg = 1'b0;
//     // regWrite = 1'b0;
//     // //mem_read = 1'b0;
//     // memWrite = 1'b0;
//     // //beq = 1'b0;
//     // //bne = 1'b0;
//     // aluOP = 2'b00;
//     // jump = 1'b1;   
//    end   

                    ///////////////////////////////////// 

 default: begin
    regWrite        = 1'b1;
    regDesination   = 1'b1;
    aluSource       = 1'b0;
    Branch          = 1'b0;
    memWrite        = 1'b0;
    memToReg        = 1'b0;
    aluOP           = 2'b10;
    jump            = 1'b0;
    jal             = 1'b0; 
    jr              = 1'b0; 
   end

 endcase
 end

endmodule
