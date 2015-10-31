// *************************************************
//
// File name        : Debounce_module.v
// Module name      : Debounce_module
//
// Author           : anyuexiu
// E-mail           : 894420894@qq.com
// Date             :
// Version          : V 1.0
//
// History
// -------------------------------------------------
// $log$
//      Add V 1.0
//
// *************************************************

module Debounce_module (
	// INPUT
	in_up,
	in_down,
	clk,
	rst_n,
	// OUTPUT 
	out_up,
	out_down,
);

input			clk,rst_n;
input			in_up,in_down;
output		out_up,out_down;

reg					rst_in;

reg	[20:0]		count;
always @ (posedge clk)
begin
	rst_in <= (!in_up)&(!in_down)&rst_n;
	if(!rst_in)
		count <= 21'd0;
	else if(count[20])
		count <= count;
	else
		count <= count + 1;
end

assign out_up = (count[20])?in_up:1'b0;
assign out_down = (count[20])?in_down:1'b0;

endmodule
