/*
  A pulse width modulation module 
*/

module main(clk, rst, ena, step, duty, pwm_out, pwm_not_out, leds, rgb, buttons);

parameter N = 8;

input wire clk, rst; 
input wire ena; // Enables the output.
input wire step; // Enables the internal counter. You should only increment when this signal is high (this is how we slow down the PWM to reasonable speeds).
input wire [N-1:0] duty; // The "duty cycle" input.
output logic pwm_out, pwm_not_out;
output logic [1:0] leds;
output logic [2:0] rgb;
input wire [1:0] buttons;

logic [N-1:0] counter;

// Some example logic to make sure that you've flashed the FPGA. One of the
// worst problems to debug is when you aren't sure that the FPGA is updating
// its HDL. If you are worried about that, make a simple change to this block
// to make sure that the FPGA is updating!
always_comb begin : io_logic 
    leds[0] = buttons[0] ^ buttons[1];
    leds[1] = buttons[0] & buttons[1];
    
    rgb[0] = ~( buttons[0] & ~buttons[1]);
    rgb[1] = ~(~buttons[0] &  buttons[1]);
    rgb[2] = ~( buttons[0] &  buttons[1]);
end


logic [$clog2(CLK_TICKS)-1:0] ticks;
pulse_generator #(.N($clog2(CLK_TICKS))) PULSE_GEN (
  .clk(clk), .rst(rst), .ena(ena), .ticks(ticks),
  .out(pwm_step)
);

logic [PWM_WIDTH-1:0] duty;
pwm #(.N(PWM_WIDTH)) PWM(
  .clk(clk), .rst(rst), .ena(ena), .step(pwm_step), .duty(duty), .out(pwm_out)
);

logic [PWM_WIDTH-1:0] duty;
not_pwm #(.N(PWM_WIDTH)) NOTPWM(
  .clk(clk), .rst(rst), .ena(ena), .step(pwm_step), .duty(duty), .out(pwm_not_out)
);

endmodule
