// Implementation of a simple Parameterized Arithmetic Logic Unit

`timescale 1ns/1ns

module param_ALU(A, B, Function, ALUout);
	parameter N = 4;
	input logic [N-1:0] A, B;
	input logic [2:0] Function;
	output logic [2*N-1:0] ALUout;

	always_comb
	begin
	case (Function)
		0: ALUout = A+B;
		1: ALUout = |{A, B};
		2: ALUout = &{A, B};
		3: ALUout = {A, B};
		default: ALUout = 1'b0;
	endcase
	end
endmodule
