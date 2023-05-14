module Adder(A, B, out);

    input [31:0] A;
    input [31:0] B; 

    input rst;
    output reg[31:0] out;

    always @(*)  
        begin
            out = A + B;
        end
endmodule


