`timescale 1ns / 1ps
module alu (alu_decode, rda, rdx, result);
	input[31:0]rda, rdx;
	input[31:0] imm_ex;
	input[3:0]alu_decode;
	output reg[31:0] result;

	always@(*)
	begin
			     if (alu_decode == 4'b0001) begin // ADD
				result = rda + rdx;
			end
			else if (alu_decode == 4'b0010) begin // SUB
				result = rda - rdx;
			end
			else if (alu_decode == 4'b0011) begin // ADD
				result = rda + rdx;
			end
			else if (alu_decode == 4'b0100) begin // SUB
				result = rda - rdx;
			end
			else if (alu_decode == 4'b0101) begin // MUL
				result = rda * rdx; 
			end
			else if (alu_decode == 4'b0110) begin // DIV
				result = rda / rdx;
			end
			else if (alu_decode == 4'b0111) begin // OR
				result = rda |	 rdx;
			end
			else if (alu_decode == 4'b1000) begin // AND
				result = rda & rdx;
			end
			else if (alu_decode == 4'b1001) begin // XOR
				result = rda ^ rdx;
			end
			else if (alu_decode == 4'b1010) begin // shift left sll
				result = rda << rdx[4:0];
			end
			else if (alu_decode == 4'b1011) begin // shift right srl
				result = rda >> rdx[4:0];
			end
			else if (alu_decode == 4'b1100) begin // slt
				result = rda < rdx ? 1 : 0 ; 
			end

	end
endmodule

