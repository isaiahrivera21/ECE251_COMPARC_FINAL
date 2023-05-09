`timescale 1ns / 1ps
module instrMem(pc, instr);
    input[31:0] pc;
    output reg[31:0] instr;

    reg [31:0] allInstr [0:31];

    initial begin
        $readmemb("test.txt", allInstr);
    end
     
     always@(pc)
     begin
        instr = allInstr[pc>>2];
     end
endmodule