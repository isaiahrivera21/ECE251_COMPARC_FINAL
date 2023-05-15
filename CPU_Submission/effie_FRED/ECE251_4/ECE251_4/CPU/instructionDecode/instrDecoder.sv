`timescale 1ns / 1ps
module instrDecoder(instr, opcode, rs1, rs2, rd, shmt, funct);

    input     [31:0] instr;
    output reg[5:0] opcode;
    output reg[4:0] rs1, rs2, rd;
    output reg[4:0] shmt; 
    output reg[5:0] funct;

    always@(instr)

    begin
        opcode  = instr[31:26];
        rs1     = instr[25:21];
        rs2     = instr[20:16];
        rd      = instr[15:11];
        shmt    = instr[10:6]; 
        funct   = instr[5:0];
    end

endmodule