////////////////////////////////////////////////////////////////////////////////
//      
//      Module Under Test: module_name 
//      Hdl: Verilog
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module clock_testbench;
    wire clk;
    logic enable;

   initial begin
        $dumpfile("clock.vcd");
        $dumpvars(0, uut);
        //$monitor("enable = %b clk = %b", enable, clk);
        $monitor("time=%0t \t enable=%b clk=%b",$realtime, enable, clk);
    end

    initial begin
        enable <= 0;
        #10 enable <= 1;
        #10000 enable <= 0;
        $finish;
    end

   clock uut(
        .ENABLE(enable),
        .CLOCK(clk)
    );
endmodule

