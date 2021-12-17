/*
  A pulse width modulation module 
*/

module main(clk, ena, pwm_out_A, pwm_out_B, leds, buttons);

parameter N = 8;
parameter M = 10;

parameter CLK_HZ = 12_000_000;
parameter CLK_PERIOD_NS = (1_000_000_000/CLK_HZ); // Approximation.
parameter PERIOD_US = 10; //us   // Keep it small in the testbench 
parameter CLK_TICKS = CLK_HZ*PERIOD_US/1_000_000;

input wire clk, ena; 
output logic pwm_out_A, pwm_out_B; 
output logic [1:0] leds;
input wire [1:0] buttons; 

logic rst; always_comb rst = buttons[0]; // Use button 0 as a reset signal.


logic [N-1:0] duty;
logic [$clog2(CLK_TICKS)-1:0] ticks; //10 or 100 80kHz - 400kHz
always_comb ticks = CLK_TICKS;
wire pwm_step;

always_comb begin : output_leds
    leds[0] = ena & pwm_out_A;
    leds[1] = ena & pwm_out_B;
end

pulse_generator #(.N($clog2(CLK_TICKS))) PULSE_GEN (
  .clk(clk), .rst(rst), .ena(ena), .ticks(ticks),
  .out(pwm_step)
);

triangle_generator #(.N(N)) TRI(
  .clk(clk), .rst(rst), .ena(ena), .out(duty)
);

pwm #(.N(N)) PWM_A(
  .clk(clk), .rst(rst), .ena(ena), .step(pwm_step), .duty(duty), .out(pwm_out_A)
);

pwm #(.N(N)) PWM_B(
  .clk(clk), .rst(rst), .ena(ena), .step(pwm_step), .duty(~duty), .out(pwm_out_B)
);

endmodule
