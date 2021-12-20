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


![methodology](https://github.com/Izziabby/Amp-lified/blob/main/images/methodology.jpeg)

# What is a MOSFET?

A metal–oxide–semiconductor field-effect transistor, more commonly known as a MOSFET, is a field-effect transistor where the voltage of the device determines the conductivity of the device. MOSFETs are used for switching or amplifying signals. 

The silicon dioxide forms the gate of the mosfet. It is used to provide isolation by prevent the direct flow of charges on gate to the conducting channel.
*insert picture here*

A MOSFET is by far the most common transistor in digital circuits, as hundreds of thousands or millions of them may be included in a memory chip or microprocessor. Since they can be made with either p-type or n-type semiconductors, complementary pairs of MOS transistors can be used to make switching circuits with very low power consumption, in the form of CMOS logic.

# Let's Put It All Together

So how do you use MOSFETs to build a Class D amplifier?

The block diagram we used to choose the direction of the project is pictured below. This showed us the functions of the Class-D amplifier, and how the switching signal is produced. 

As can be seen in the diagram, the audio input is at the non-inverting terminal, and the high-freuency triangular signal is on the inverting terminal. when the voltage of the input audio signal is greater than the voltage of the triangular wave, the output of the comparator goes high, and when the signal is low, the output is low. With this setup, we modulated the input audio signal with a high-frequency carrier signal, which then connects to a MOSFET gate drive IC, and as the name implies, the driver is used to drive the gate of two MOSFETs for both the high side and low side once. At the output, we get a powerful high-frequency square wave at the output, which we pass through a low pass filter stage to get our final audio signal. 

# Building the Circuit

We based our circuit for this project off of this schematic:

[modelsch](https://github.com/Izziabby/Amp-lified/blob/main/images/model_schematic.png) [3]

# Our Schematic

[oursch](https://github.com/Izziabby/Amp-lified/blob/main/images/our_schematic.png)

# Our Circuit

[ourcir](https://github.com/Izziabby/Amp-lified/blob/main/images/our_circuit.jpeg)


We used 2 NMOS, 2 PMOS, 2 inductors, 2 capacitors, and one FPGA to to build this circuit. The general circuit consists of a pulse-width modulator, two output MOSFETs, and an external lowpass filter (LF and CF) to recover the amplified audio signal. As shown in the figure, both MOSFETs operate as current-steering switches by alternately connecting the output node to VDD and ground, which makes the output of a Class D amplifier a high-frequency square wave, which is then pulse-width modulated by the input audio signal.

After constructing the circuit, we had to find a way to connect it to the computers, and actually input our waveforms to get amplfied waveforms as an output. To do this, we used an FPGA, as explained in the next section.


We used 2 NMOS, 2 PMOS, 2 inductors, 2 capacitors, and one FPGA to to build this circuit. The general circuit consists of a pulse-width modulator, two output MOSFETs, and an external lowpass filter (LF and CF) to recover the amplified audio signal. As shown in the figure, both MOSFETs operate as current-steering switches by alternately connecting the output node to VDD and ground, which makes the output of a Class D amplifier a high-frequency square wave, which is then pulse-width modulated by the input audio signal.

After constructing the circuit, we had to find a way to connect it to the computers, and actually input our waveforms to get amplfied waveforms as an output. To do this, we used an FPGA, as explained in the next section.

[main](https://github.com/Izziabby/Amp-lified/blob/main/images/main_block_diagram.jpeg)

###Pulse Generator

Inputs: clk, rst, ena

Output: step

[pulse](https://github.com/Izziabby/Amp-lified/blob/main/images/pulse_gen_block_diagram.png)

###Triangle Generator
Inputs: clk, rst, ena

Output: duty


[tri](https://github.com/Izziabby/Amp-lified/blob/main/images/triangle_gen_block_diagram.png)

###PWM Generator
Inputs: clk, rst, ena, step, duty

Output: A

[pwm](https://github.com/Izziabby/Amp-lified/blob/main/images/pwm_block_diagram.jpeg)

The output, A, pwm signal is connected to the 'A' side of the circuit as listed in the schematic. In addition, we have to NOT the A signal in order to get our 'B' side signal. This is connected to the 'B' side of the circuit as listed in the schematic. 

Since the A and B side signals are opposites of eachother this means that only 2 transistors are on at a time switching between A side and B side. This creates a differential PWM signal across the load. [1]

# Integration

Once all of the verilog code worked in simulation, it was time to flash it to the FPGA. The PWM output A and B are attached to pins 33 and 34 respectively. These A and B signals were sent through the circuit as indicated by the schematic.

#Circuit Testing

An Analog Discovery 2 ocsilliscope was used to measure all signals. 

First, we wanted to test if the the pwm signals were being output by the FPGA. To test this we measured the signal at the corresponding pin referenced to ground. We did this for both the 'A' and 'B' side. As shown below, the FPGA is outputing the correct signals.

[ab](https://github.com/Izziabby/Amp-lified/blob/main/images/pwm_output_results.jpeg)

Next, we want to make sure the transistors are working so we measured the between both sides drains. Below, we see an amplified PWM signal so we be assured the transistors are functioning properly.


[fet](https://github.com/Izziabby/Amp-lified/blob/main/images/mosfet_output_results.jpeg)

When trying to measure the result of actual speaker output, we ran into some issues. For some reason, the ocilliscope wasn't picking up any data after the LC filters. Theoretically, we should be able to see an amplified sine wave here that would be output through the speaker. Below is a simplified block diagram:


[hl](https://github.com/Izziabby/Amp-lified/blob/main/images/highlevel_block_diagram.jpeg) [22]

# BOM

General BOM:

*   [2nMOS MOSFETS](https://www.digikey.com/en/products/detail/IRLB4132PBF/IRLB4132PBF-ND/5270592?itemSeq=384091191)
*   [2pMOS MOSFETS](https://www.digikey.com/en/products/detail/IRF9Z34NPBF/IRF9Z34NPBF-ND/811960?itemSeq=384090807)
*   2, 26uH Inductors
*   2, 10uF Capacitors
*   FPGA

# Resources

Class D Audio Amplifiers: 
1.   https://www.maximintegrated.com/en/design/technical-documents/app-notes/3/3977.html
2. https://www.analog.com/en/analog-dialogue/articles/class-d-audio-amplifiers.html
3. https://handsontec.com/index.php/class-d-audio-amplifier-basic/ 
4. https://circuitdigest.com/electronic-circuits/how-to-build-a-class-d-audio-amplifier-using-mosfets

High side and low side drivers:
5. https://electronics.stackexchange.com/questions/188745/high-side-driver-and-low-side-driver 

Videos:
6. https://www.youtube.com/watch?v=O1UagNkcxi4 
7. https://www.youtube.com/watch?v=7M2cWYeBmkc 
8. https://www.youtube.com/watch?v=L5VyYHkcbvU 
9. https://www.youtube.com/watch?v=YaygMLNVLOI&ab_channel=HardwareAcademy

Op-Amps/PWM:
10. https://www.electronicdesign.com/power-management/article/21800930/pulsewidth-modulator-features-versatile-operating-parameters 
11. https://www.quora.com/Can-anyone-explain-the-pulse-width-modulation-circuit-using-an-op-amp 
12. https://e2e.ti.com/blogs_/b/industrial_strength/posts/so-which-pwm-technique-is-best-part-4

H-bridge:
13. https://www.modularcircuits.com/blog/articles/h-bridge-secrets/h-bridges-the-basics/ 

Synthesizer in Verilog:
14. https://courses.csail.mit.edu/6.111/f2004/projects/ac_report.pdf 
15. http://zipcpu.com/dsp/2017/07/11/simplest-sinewave-generator.html 
16. https://zipcpu.com/dsp/2017/08/26/quarterwave.html 
17. https://electronics.stackexchange.com/questions/436069/variable-frequency-for-sine-wave-in-verilog 
18. https://miscircuitos.com/sinus-wave-generation-with-verilog-using-vivado-for-a-fpga/ 
19. https://www.chipverify.com/verilog/verilog-clock-generator
20. https://www.electronicsforu.com/electronics-projects/pwm-generator-microcontroller-verilog

Images:
21. https://handsontec.com/index.php/class-d-audio-amplifier-basic/ 
22. https://www.allaboutcircuits.com/projects/how-to-build-a-class-d-power-amplifier/ 







