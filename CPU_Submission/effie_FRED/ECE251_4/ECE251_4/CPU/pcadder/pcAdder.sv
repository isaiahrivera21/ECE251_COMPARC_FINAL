module pcAdder(pc,pcAddr);
    input[31:0] pc;
    output reg[31:0] pcAddr;

    always @(*)  
        begin
            pcAddr = pc + 4;
        end
endmodule


