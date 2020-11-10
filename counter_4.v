module counter_4bit(input wire clock,reset,up_down , output wire [3:0] count_num);

reg [3:0] num = 4'b0000;
always @(posedge (clock) or posedge (reset))
begin 
	if(reset)
		num=4'b0000;
	else 
		if(up_down)
			if(num == 4'b1111) num=4'b0000;
			else num=num+4'b0001;
		else 
			if(num == 4'b0000) num=4'b1111;
			else num=num-4'b0001;
end
assign count_num= num;
endmodule
