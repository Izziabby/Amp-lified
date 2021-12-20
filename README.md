# Amp-lified

Isabella Abilheira, Sree Chalimadugu, Simrun Mutha, and Prisha Sadhwani

In this project, we are builing a Class-D amplifier and testing its abilities using a generated a pwm signal created on Verilog via an FPGA.

# Class D Amplifiers Overview

Amplifiers are electrical components that use transistors to create a scaled version of the input audio.

Class D Amplifiers, also known as switching power amplifiers, work by converting the input signal into a PWM wave by comparing it to a triangle wave. Within every period, the duty ratio of the PWM signal is proportional to the amplitude of the input audio wave.

Compared to other amplifiers, the Class D amplifiers have much lower power dissipation which produces less heat, improves battery life and saves circuit board space.

# Our Project

The objective of this project is to research and build a Class D full bridge amplifier. Our main goals are to learn more about MOSFETs and their applications, particularly in the realm of sound. To start off, we would be constructing an H-bridge circuit (explained in the circuits section) to develop the Class D amplifier. To test the amplifier, we would then be sending an audio signal in waveform format, and testing the functionality of our amplifier by analyzing our output waveforms - i.e. seeing if the level of amplification matches our predictions. 

Using Verilog, we will generate a waveform and then compare it to a triangle wave to create our PWM signal. This signal will be sent directly to the circuit. Here is block diagram that shows the overall methodology:


![](/images/methodolgy.jpeg)


