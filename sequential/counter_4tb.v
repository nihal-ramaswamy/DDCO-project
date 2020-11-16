module tb_counter();

reg clock,up_down,reset;
wire [3:0]q;
counter c4(clock, reset,up_down , q);
initial 
	begin 
		$dumpfile("tb_counter_dump.vcd"); 
		$dumpvars(0,tb_counter); 
	end
initial 
begin clock = 1'b0; repeat(60) #10 clock =~ clock;
end

initial 
begin
	reset=1'b0;
	up_down=1'b0;
	#10
	reset=1'b1;
	#10;
	reset=1'b0;
	up_down=1'b0;
	#90
	reset=1'b0;
	up_down=1'b1;
	#50
	reset=1'b1;
	#20
	reset=1'b0;
	#250;
	reset=1'b0;
	up_down=1'b0;
end

endmodule
