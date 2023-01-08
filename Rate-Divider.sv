// Implementation of a Rate Divider
// Speed is 00 --> Keep Original Clock Frequency
// Speed is 01 --> Create frequency 1 Hz
// Speed is 10 --> Create frequency 0.5 Hz
// Speed is 11 --> Create frequency 0.25 Hz

`timescale 1ns/`ns

module RateDivider #(parameter CLOCK_FREQUENCY = 500) (input logic ClockIn, Reset, input logic [1:0] Speed, output logic Enable);
	logic [$clog2((CLOCK_FREQUENCY << 2) - 1):0] load, RateDividerCount;

	always_comb
	begin
	case (Speed)
		0: load = 0;
		default: load = (CLOCK_FREQUENCY << (Speed - 1)) - 1; //CLOCK_FREQUENCY*(2**(Speed - 1));
	endcase
	end

	always_ff @(posedge ClockIn)
	begin
	if (Reset) RateDividerCount <= 0;
	else if (~Enable) RateDividerCount <= RateDividerCount - 1;
	else RateDividerCount <= load;
	end
	
	assign Enable = &(~RateDividerCount);
endmodule
