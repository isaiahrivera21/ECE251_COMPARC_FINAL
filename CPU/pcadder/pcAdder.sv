module pcAdder(pc, rst, pcAddr);
    input[31:0] pc;
    input rst;
    output reg[31:0] pcAddr;

    always @(*)  
        begin
            pcAddr = pc + 4;
        end
endmodule


