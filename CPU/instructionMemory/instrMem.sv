`timescale 1ns / 1ps
module instrMem(pc, instr);
    input[31:0] pc;
    output reg[31:0] instr;

    reg [31:0] allInstr [0:31];

    initial begin
        $readmemb("recursive_add_exe", allInstr,0,15); //start adr 0 end adr 1 
    end
     
     always@(pc) //whenever program counter changes 
     begin
        instr = allInstr[pc>>2]; //makes it byte adressable  
     end
     //allInstr[0000001]?? 
endmodule