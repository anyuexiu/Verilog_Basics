// *************************************************
//
// File name        : Key_Unit_Pulse.v
// Module name      : Key_Unit_Pulse
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

module Key_Unit_Pulse (
    // INPUT
    in_key,
    clk,
    rst_n,
    // OUTPUT
    out_unit_pulse_key_up,
    out_unit_pulse_key_down,
);

input			clk,rst_n;
input			in_key;
output		out_unit_pulse_key_up;
output 		out_unit_pulse_key_down;

reg key_1,key_2,key_3;

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		key_1 <= 1'b1;
		key_2 <= 1'b1;
		key_2 <= 1'b1;
	end
	else
	begin
		key_1 <= in_key;
		key_2 <= key_1;
		key_3 <= key_2;
	end
end

assign out_unit_pulse_key_down = (~key_3)&(key_2);
assign out_unit_pulse_key_up = (key_3)&(~key_2);

endmodule

