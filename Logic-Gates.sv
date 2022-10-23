// Implementation of classic AND, OR, NOT gates, as well as a 2-to-1 Multiplexer

`timescale 1 ns / 1 ns

module v7404(input logic pin1, pin3, pin5, pin9, pin11, pin13, 
	output logic pin2, pin4, pin6, pin8, pin10, pin12);
	assign pin2 = ~pin1;
	assign pin4 = ~pin3;
	assign pin6 = ~pin5;
	assign pin8 = ~pin9;
	assign pin10 = ~pin11;
	assign pin12 = ~pin13;
endmodule

module v7408(input logic pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13,
	output logic pin3, pin6, pin8, pin11);
	assign pin3 = pin1 & pin2;
	assign pin6 = pin4 & pin5;
	assign pin8 = pin9 & pin10;
	assign pin11 = pin12 & pin13;
endmodule

module v7432(input logic pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13, 
	output logic pin3, pin6, pin8, pin11);
	assign pin3 = pin1 | pin2;
	assign pin6 = pin4 | pin5;
	assign pin8 = pin9 | pin10;
	assign pin11 = pin12 | pin13;
endmodule

module mux2to1(input logic x,y,s, output logic m);
	logic x_out, s_not, y_out;
	v7404 not_(.pin1(s), .pin2(s_not));
	v7408 and_(.pin1(x), .pin2(s_not), .pin3(x_out), .pin4(y), .pin5(s), .pin6(y_out));
	v7432 or_(.pin1(x_out), .pin2(y_out), .pin3(m));
endmodule
