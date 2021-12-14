/*
  A pulse width modulation module 
*/

module main(clk, rst, ena, pwm_out, leds, buttons);

parameter N = 8;
parameter M = $clog2(CLK_TICKS);

parameter CLK_HZ = 12_000_000;
parameter CLK_PERIOD_NS = (1_000_000_000/CLK_HZ); // Approximation.
parameter PERIOD_US = 10; //us   // Keep it small in the testbench 
parameter CLK_TICKS = CLK_HZ*PERIOD_US/1_000_000;

input wire clk, rst, ena; 
output logic pwm_out;
output logic [1:0] leds;
input wire [1:0] buttons;

logic [N-1:0] duty;
logic [M-1:0] counter;
logic [M-1:0] ticks; //10 or 100 80kHz - 400kHz

//always_comb rst = buttons[0]; // Use button 0 as a reset signal.
//logic ena; always_comb ena = buttons[1]; // Use button 1 as a enable signal.

// Some example logic to make sure that you've flashed the FPGA. One of the
// worst problems to debug is when you aren't sure that the FPGA is updating
// its HDL. If you are worried about that, make a simple change to this block
// to make sure that the FPGA is updating!
always_comb begin : output_leds
    leds[0] = pwm_out;
end

pulse_generator #(.N($clog2(CLK_TICKS))) PULSE_GEN (
  .clk(clk), .rst(rst), .ena(ena), .ticks(ticks),
  .out(pwm_step)
);

triangle_generator #(.N(N)) TRI(
  .clk(clk), .rst(rst), .ena(ena), .out(duty)
);

pwm #(.N(N)) PWM(
  .clk(clk), .rst(rst), .ena(ena), .step(pwm_step), .duty(duty), .out(pwm_out)
);

endmodule
