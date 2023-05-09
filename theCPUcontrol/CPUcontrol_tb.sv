`timescale 1ns / 1ps

module CPUcontrol_tb;
    // Inputs
    reg [5:0] opcode;
    
    // Outputs
    wire [1:0] aluOP;
    wire regWrite, regDesination, aluSource, Branch, memWrite, memToReg, jump, jal, jr, mem_read;

    // Instantiate the CPUcontrol module
    CPUcontrol dut(
        .opcode(opcode),
        .aluOP(aluOP),
        .regWrite(regWrite),
        .regDesination(regDesination),
        .aluSource(aluSource),
        .Branch(Branch),
        .memWrite(memWrite),
        .memToReg(memToReg),
        .jump(jump),
        .jal(jal),
        .jr(jr),
        .mem_read(mem_read)
    );
    
    // Initialize inputs
    initial begin
        opcode = 6'b000000; // R-type
        #10;
        opcode = 6'b000010; // lw
        #10;
        opcode = 6'b000011; // sw
        #10;
        opcode = 6'b000101; // ANDI
        #10;
        opcode = 6'b001000; // JUMP
        #10;
        opcode = 6'b001001; // JAL
        #10;
        opcode = 6'b001100; // Invalid opcode
        #10;
        $finish;
    end
    
    // Monitor the outputs
    always @(*)
     begin
        $display("opcode = %b", opcode);
        $display("aluOP = %b", aluOP);
        $display("regWrite = %b", regWrite);
        $display("regDesination = %b", regDesination);
        $display("aluSource = %b", aluSource);
        $display("Branch = %b", Branch);
        $display("memWrite = %b", memWrite);
        $display("memToReg = %b", memToReg);
        $display("jump = %b", jump);
        $display("jal = %b", jal);
        $display("jr = %b", jr);
        $display("mem_read = %b", mem_read);
        $display("--------------------");
    end
endmodule
