`timescale 1ns / 1ps
module alu (alu_decode, rda, rdx, result, Hi, Lo, remain, zero);

	parameter n  = 32; 
	parameter m  = 4;

	input	[(n - 1):0] rda, rdx;
	input	[(m - 1):0]  alu_decode;

	output logic[(n - 1):0] result,Hi,Lo,remain;
	output logic[(n + n - 1):0] Hilo;
	output logic zero; 

	//zero flag 
	// assign zero = (result == {n{1'b0}}); 
	//look into what zero flag does in context of data path. Though zero flag == 1 when the reuslt == 0 

	assign zero = ((result) == 0) ? 1 : 0; //if A - B = 0, asser the zero flag



	always@(rda, rdx, alu_decode) // alu recalcs stuff if any of these changes 
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
				Hilo = rda * rdx; 
				Hi = Hilo[63:32];  //not sure if high and lo need assigns 
				Lo = Hilo[31:0]; 
			end
			else if (alu_decode == 4'b0110) begin // DIV
				result = rda / rdx;
				remain = rda % rdx; 
			end
			else if (alu_decode == 4'b0111) begin // OR
				result = rda |  rdx;
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
				result = (rda < rdx) ? 1 : 0 ;   
			end

	end
	
endmodule

