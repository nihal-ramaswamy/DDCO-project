module tb_counter();

reg clock,reset,up_down;
wire [3:0]num;
counter_4bit c1(clock,reset,up_down ,num);
initial 
	begin 
		$dumpfile("tb_counter_dump.vcd"); 
		$dumpvars(0,tb_counter); 
	end
initial 
begin clock = 1'b0; repeat(60) #10 clock =~ clock;
end

initial begin
	reset=1'b0;
	up_down=1'b0;
	#270;
	up_down=1'b1;
	#80
	reset=1'b1;
	//up_down=1'b0;
	#20;
	reset=1'b0;
end

endmodule
