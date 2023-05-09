module pcMux(pcAddr, jAddr, pc_sel, true_pc);
    input pc_sel;
    input[31:0] pcAddr, jAddr;
    output reg[31:0] true_pc;

    always@(*)
    begin
        if(pc_sel == 1'b1)
        begin
            true_pc = jAddr;
        end
        else
        begin
            true_pc = pcAddr;
        end
    end
endmodule
