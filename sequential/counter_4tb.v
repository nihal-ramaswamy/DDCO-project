module tb_counter();

reg clock_signal,up_down,reset_signal;
wire [3:0]output_wire;
counter c4(clock_signal, reset_signal,up_down , output_wire);
initial 
	begin 
		$dumpfile("tb_counter_dump.vcd"); 
		$dumpvars(0,tb_counter); 
	end
initial 
begin clock_signal = 1'b0; repeat(60) #10 clock_signal =~ clock_signal;
end

initial 
begin
	reset_signal=1'b0;
	up_down=1'b0;
	#10
	reset_signal=1'b1;
	#10;
	reset_signal=1'b0;
	up_down=1'b0;
	#90
	reset_signal=1'b0;
	up_down=1'b1;
	#50
	reset_signal=1'b1;
	#20
	reset_signal=1'b0;
	#250;
	reset_signal=1'b0;
	up_down=1'b0;
end

endmodule
