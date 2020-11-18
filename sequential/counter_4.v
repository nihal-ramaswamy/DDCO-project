module and2 (input wire input_wire0, input_wire1, output wire output_wire);

	assign output_wire = input_wire0 & input_wire1;

endmodule

module or2 (input wire input_wire0, input_wire1, output wire output_wire);

	assign output_wire = input_wire0 | input_wire1;

endmodule

module toggle_flip_flop (input wire clock_signal,reset_wire,toggle_wire, output data_wire);

	reg data_wire;
	always @ (posedge clock_signal) 
	begin
	if(reset_wire)
		data_wire=4'b0000;
	else 
		if(toggle_wire) data_wire=~data_wire;	
		else data_wire=data_wire;		
end

endmodule

module down_counter (input wire  clock_signal, reset_signal, output wire[3:0]q);

	wire [5:0]a;
	wire [2:0]or_out;

	toggle_flip_flop t1 ( clock_signal, reset_signal, 1'b1, q[0]);
	and2 and2_1 (q[0], 1'b0, a[0]);
	and2 and2_2 (~q[0], 1'b1, a[1]);
	or2 or2_1 (a[0], a[1], or_out[0]);

	toggle_flip_flop t2 ( clock_signal, reset_signal, or_out[0], q[1]);
	and2 and2_3 (q[1], a[0], a[2]);
	and2 and2_4 (~q[1], a[1], a[3]);
	or2 or2_2 (a[2], a[3], or_out[1]);

	toggle_flip_flop t3 ( clock_signal, reset_signal, or_out[1], q[2]);
	and2 and2_5 (q[2], a[2], a[4]);
	and2 and2_6 (~q[2], a[3], a[5]);
	or2 or2_3 (a[4], a[5], or_out[2]);

	toggle_flip_flop t4 ( clock_signal, reset_signal, or_out[2], q[3]);

endmodule


module up_counter (input wire  clock_signal, reset_signal, output wire[3:0]q);

	wire [5:0]a;
	wire [2:0]or_out;

	toggle_flip_flop t1 ( clock_signal, reset_signal, 1'b1, q[0]);
	and2 and2_1 (q[0], 1'b1, a[0]);
	and2 and2_2 (~q[0], 1'b0, a[1]);
	or2 or2_1 (a[0], a[1], or_out[0]);

	toggle_flip_flop t2 ( clock_signal, reset_signal, or_out[0], q[1]);
	and2 and2_3 (q[1], a[0], a[2]);
	and2 and2_4 (~q[1], a[1], a[3]);
	or2 or2_2 (a[2], a[3], or_out[1]);

	toggle_flip_flop t3 ( clock_signal, reset_signal, or_out[1], q[2]);
	and2 and2_5 (q[2], a[2], a[4]);
	and2 and2_6 (~q[2], a[3], a[5]);
	or2 or2_3 (a[4], a[5], or_out[2]);

	toggle_flip_flop t4 ( clock_signal, reset_signal, or_out[2], q[3]);

endmodule


