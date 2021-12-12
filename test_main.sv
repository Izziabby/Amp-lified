`timescale 1ns / 1ps

module test_main;

parameter CLK_HZ = 12_000_000;
parameter CLK_PERIOD_NS = (1_000_000_000/CLK_HZ); // Approximation.
parameter PERIOD_US = 1000; //ms   // Keep it small in the testbench 
parameter CLK_TICKS = CLK_HZ/1_000_000*PERIOD_US;
parameter PWM_WIDTH = 4;

logic clk, rst, ena;
logic [$clog2(CLK_TICKS)-1:0] ticks;
wire pwm_step, pwm_out, pwm_not_out;

logic [1:0] leds;
logic [2:0] rgb;
wire [1:0] buttons;

logic [PWM_WIDTH-1:0] duty;
main #(.N(N)) UUT(
    .clk(clk), .rst(rst), .ena(ena), .step(pwm_step), .duty(duty), .pwm_out(pwm_out), 
    .pwm_not_out(pwm_not_out), .buttons(buttons),
    .leds(leds), .rgb(rgb)
);

always #(CLK_PERIOD_NS/2) clk = ~clk;

initial begin
$dumpfile("new.fst");
$dumpvars(0, UUT);

rst = 1;
ena = 1;
clk = 0;
ticks = CLK_TICKS;
$display("Enable the PWM %d ticks...", ticks);

repeat (1) @(negedge clk);
rst = 0;

for(int i = 0; i < (2<<(PWM_WIDTH - 1)); i = i + 1) begin
    duty = i;
    repeat (2*(2<<PWM_WIDTH)*CLK_TICKS) @(posedge clk);
end

@(negedge clk);
ena = 0;
repeat (CLK_TICKS) @(posedge clk);
$finish;
end

endmodule