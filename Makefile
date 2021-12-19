# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -g2012 -Wall -y ./ -I ./
VVP=vvp
VVP_POST=-fst
VIVADO=vivado -mode batch -source

#ILI9341_SRCS=spi_controller.sv ili9341_display_controller.sv spi_types.sv ili9341_defines.sv block_rom.sv
#FT6206_SRCS=i2c_controller.sv ft6206_controller.sv i2c_types.sv ft6206_defines.sv 
# Add any new source files needed for the final bitstream here
#MAIN_SRCS=main.sv pulse_generator.sv pwm.sv triangle_generator.sv block_ram.sv ${ILI9341_SRCS} ${FT6206_SRCS}
MAIN_SRCS=main.sv pulse_generator.sv pwm.sv triangle_generator.sv

# Look up .PHONY rules for Makefiles
.PHONY: clean submission remove_solutions

test_pulse_generator: tests/test_pulse_generator.sv pulse_generator.sv
	${IVERILOG} $^ -o test_pulse_generator.bin && ${VVP} test_pulse_generator.bin ${VVP_POST}

test_pwm: tests/test_pwm.sv pulse_generator.sv pwm.sv
	@echo "This might take a while, we're testing a lot of clock cycles!"
	${IVERILOG} $^ -o test_pwm.bin && ${VVP} test_pwm.bin ${VVP_POST}

test_tri: tests/test_triangle_generator.sv triangle_generator.sv 
	@echo "This might take a while, we're testing a lot of clock cycles!"
	${IVERILOG} $^ -o test_tri.bin && ${VVP} test_tri.bin ${VVP_POST}

test_main: tests/test_main.sv ${MAIN_SRCS} pulse_generator.sv pwm.sv 
	@echo "This might take a while, we're testing a lot of clock cycles!"
	${IVERILOG} tests/test_main.sv ${MAIN_SRCS} -o test_main.bin && ${VVP} test_main.bin ${VVP_POST}

main.bit: main.sv $(MAIN_SRCS)
	@echo "########################################"
	@echo "#### Building FPGA bitstream        ####"
	@echo "########################################"
	${VIVADO} build.tcl

program_fpga_vivado: main.bit build.tcl program.tcl
	@echo "########################################"
	@echo "#### Programming FPGA (Vivado)      ####"
	@echo "########################################"
	${VIVADO} program.tcl

program_fpga_digilent: main.bit build.tcl
	@echo "########################################"
	@echo "#### Programming FPGA (Digilent)    ####"
	@echo "########################################"
	djtgcfg enum
	djtgcfg prog -d CmodA7 -i 0 -f main.bit


# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd *.fst vivado*.log *.jou vivado*.str *.log *.checkpoint *.bit *.html *.xml
	rm -rf .Xil

# Call this to generate your submission zip file.
submission:
	zip submission.zip Makefile *.sv README.md docs/* *.tcl *.xdc tests/*.sv *.pdf
