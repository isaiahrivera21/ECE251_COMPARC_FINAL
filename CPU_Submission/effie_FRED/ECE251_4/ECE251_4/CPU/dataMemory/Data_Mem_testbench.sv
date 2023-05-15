////////////////////////////////////////////////////////////////////////////////
//      
//      Module Under Test: module_name 
//      Hdl: Verilog
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`include "./Data_Mem.sv"
`include "../Clock/clock.sv"

module Data_Mem_tb;
    logic [31:0] readdata, writedata;
    logic [31:0] dmem_addr;
    logic write_enable;
    logic clk, clock_enable;

   initial begin
        $dumpfile("Data_Mem.vcd");
        $dumpvars(0, uut, uut1);
        $monitor("time=%0t write_enable=%b dmem_addr=%h readdata=%h writedata=%h",
            $realtime, write_enable, dmem_addr, readdata, writedata);
    end

    initial begin

        #10 clock_enable <= 1;
        #20 writedata = 32'hFFFFFFFF;
        #20 dmem_addr <= 6'b000000;
        #20 write_enable <= 1;
        #20 write_enable <= 0;


        #20 dmem_addr <= 6'b000001;
        #20 writedata = 32'h0000FFFF;
        #20 write_enable <= 1;
        #20 write_enable <= 0;
   
        #20 dmem_addr <= 6'b000010;
        #20 writedata = #32'h00000000;
        #20 write_enable <= 1;
        #20 write_enable <= 0; 
        $finish; 

    end

   Data_Mem uut(
        .clk(clk),
        .write_enable(write_enable),
        .addr(dmem_addr),
        .writedata(writedata),
        .readdata(readdata)
    );

    clock uut1(
        .ENABLE(clock_enable),
        .CLOCK(clk)
    );
endmodule
