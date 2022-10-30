// Implementation of a 4-bit Full Adder

`timescale 1ns/1ns

module four_bit_fa(input logic [3:0] a, b, input logic c_in, output logic [3:0] s, c_out);
	fa add1(a[0], b[0], c_in, s[0], c_out[0]);
	fa add2(a[1], b[1], c_out[0], s[1], c_out[1]);
	fa add3(a[2], b[2], c_out[1], s[2], c_out[2]);
	fa add4(a[3], b[3], c_out[2], s[3], c_out[3]);
endmodule

module fa(input logic a, b, c_in, output logic s, c_out);

	logic a_xor_b;

	assign a_xor_b = a^b;
	assign s = a_xor_b^c_in;
	always_comb
	begin
	case (a_xor_b)
		0: c_out = b;
		1: c_out = c_in;
		default: c_out = 1'b0;
	endcase
	end
endmodule
