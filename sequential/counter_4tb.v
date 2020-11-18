module counter_tb();

reg clock,reset;
wire [3:0]q_up,q_down;
up_counter uc(clock,reset,q_up);
down_counter dc(clock,reset,q_down);

initial begin 
	$dumpfile("counter4_tb.vcd");
	$dumpvars(0,counter_tb);
end 

initial 
begin 
clock=0; repeat(70) #10 clock=~clock;
end

initial 
begin
reset=1'b1;
#30
reset=1'b0;
#160
reset=1'b1;
#20
reset=1'b0;
end

endmodule
