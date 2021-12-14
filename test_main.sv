`timescale 1ns / 1ps

module test_main;

parameter CLK_HZ = 12_000_000;
parameter CLK_PERIOD_NS = (1_000_000_000/CLK_HZ); // Approximation.
parameter PERIOD_US = 10; //us   // Keep it small in the testbench 
parameter CLK_TICKS = CLK_HZ*PERIOD_US/1_000_000;
parameter PWM_WIDTH = 4;
parameter M_VAL = $clog2(CLK_TICKS);

logic clk, rst, ena;
logic [$clog2(CLK_TICKS)-1:0] ticks;
wire pwm_step, pwm_out, duty;

logic [1:0] leds;
wire [1:0] buttons;

main #(.N(PWM_WIDTH), .M(M_VAL)) UUT(
    .clk(clk), .rst(rst), .ena(ena),
    .pwm_out(pwm_out), .buttons(buttons), .leds(leds)
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

repeat (10*CLK_TICKS) @(posedge clk);

repeat (CLK_TICKS*2) @(negedge clk);
  ena = 0;
  repeat (CLK_TICKS) @(posedge clk);
  $finish;

end

endmodule