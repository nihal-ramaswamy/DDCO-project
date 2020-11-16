module and2 (input wire i0, i1, output wire o);

	assign o = i0 & i1;

endmodule

module or2 (input wire i0, i1, output wire o);

	assign o = i0 | i1;

endmodule

module tff (input wire clock,reset,t, output d);

	reg d;
	always @ (posedge clock) 
	begin
	if(reset)
		d=4'b0000;
	else 
		if(t) d=~d;	
		else d=d;		
end

endmodule

module counter (input wire clock, reset, up_down, output wire[3:0]q);

	wire [5:0]a;
	wire [2:0]or_out;

	tff t1 (clock, reset, 1'b1, q[0]);
	and2 and2_1 (q[0], up_down, a[0]);
	and2 and2_2 (~q[0], ~up_down, a[1]);
	or2 or2_1 (a[0], a[1], or_out[0]);

	tff t2 (clock, reset, or_out[0], q[1]);
	and2 and2_3 (q[1], a[0], a[2]);
	and2 and2_4 (~q[1], a[1], a[3]);
	or2 or2_2 (a[2], a[3], or_out[1]);

	tff t3 (clock, reset, or_out[1], q[2]);
	and2 and2_5 (q[2], a[2], a[4]);
	and2 and2_6 (~q[2], a[3], a[5]);
	or2 or2_3 (a[4], a[5], or_out[2]);

	tff t4 (clock, reset, or_out[2], q[3]);

endmodule


