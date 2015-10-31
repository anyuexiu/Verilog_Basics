// *************************************************
//
// File name        : Key_Debounce_module.v
// Module name      : Key_Debounce_module
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

module Key_Debounce_module (
    // INPUT
    in_key,
    clk,
    rst_n,
    // OUTPUT
    out_unit_pulse_key_down,
    out_unit_pulse_key_up,
);

input			clk,rst_n;
input			in_key;
output		out_unit_pulse_key_up;
output 		out_unit_pulse_key_down;

// ******************** Key_Unit_Pulse **********************//
wire U_Key_Unit_Pulse_OUT_out_unit_pulse_key_up;
wire U_Key_Unit_Pulse_OUT_out_unit_pulse_key_down;
Key_Unit_Pulse U_Key_Unit_Pulse(
    // INPUT
    .in_key(in_key),
    .clk(clk),
    .rst_n(rst_n),
    // OUTPUT
    .out_unit_pulse_key_up(U_Key_Unit_Pulse_OUT_out_unit_pulse_key_up),
    .out_unit_pulse_key_down(U_Key_Unit_Pulse_OUT_out_unit_pulse_key_down),
);
// ******************** Key_Unit_Pulse **********************//

// ******************** Debounce_module **********************//
Debounce_module U_Debounce_module(
	// INPUT
	.in_up(U_Key_Unit_Pulse_OUT_out_unit_pulse_key_up),
	.in_down(U_Key_Unit_Pulse_OUT_out_unit_pulse_key_down),
	.clk(clk),
	.rst_n(rst_n),
	// OUTPUT 
	.out_up(out_unit_pulse_key_up),
	.out_down(out_unit_pulse_key_down),
);
// ******************** Debounce_module **********************//

endmodule

