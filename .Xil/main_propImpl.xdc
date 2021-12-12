set_property SRC_FILE_INFO {cfile:/home/iabilheira/Documents/Amp-lified/main.xdc rfile:../main.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L12P_T1_MRCC_14 Sch=gclk
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports { leds[0] }]; #IO_L12N_T1_MRCC_16 Sch=led[1]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { leds[1] }]; #IO_L13P_T2_MRCC_16 Sch=led[2]
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { rgb[2] }]; #IO_L14N_T2_SRCC_16 Sch=led0_b
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports { rgb[1] }]; #IO_L13N_T2_MRCC_16 Sch=led0_g
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { rgb[0] }]; #IO_L14P_T2_SRCC_16 Sch=led0_r
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { buttons[0] }]; #IO_L19N_T3_VREF_16 Sch=btn[0]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { buttons[1] }]; #IO_L19P_T3_16 Sch=btn[1]
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W2    IOSTANDARD LVCMOS33 } [get_ports { pwm_out }]; #IO_L5N_T0_34 Sch=pio[32]
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports { pwm_not_out }]; #IO_L5P_T0_34 Sch=pio[33]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W3    IOSTANDARD LVCMOS33 } [get_ports { ena }]; #IO_L6N_T0_VREF_34 Sch=pio[34]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V3    IOSTANDARD LVCMOS33 } [get_ports { rst }]; #IO_L6P_T0_34 Sch=pio[35]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W5    IOSTANDARD LVCMOS33 } [get_ports { step }]; #IO_L12P_T1_MRCC_34 Sch=pio[36]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V4    IOSTANDARD LVCMOS33 } [get_ports { duty[0] }]; #IO_L11N_T1_SRCC_34 Sch=pio[37]
set_property src_info {type:XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U4    IOSTANDARD LVCMOS33 } [get_ports { duty[1] }]; #IO_L11P_T1_SRCC_34 Sch=pio[38]
set_property src_info {type:XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V5    IOSTANDARD LVCMOS33 } [get_ports { duty[2] }]; #IO_L16N_T2_34 Sch=pio[39]
set_property src_info {type:XDC file:1 line:30 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W4    IOSTANDARD LVCMOS33 } [get_ports { duty[3] }]; #IO_L12N_T1_MRCC_34 Sch=pio[40]
set_property src_info {type:XDC file:1 line:31 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U5    IOSTANDARD LVCMOS33 } [get_ports { duty[4] }]; #IO_L16P_T2_34 Sch=pio[41] #skipping it, it's the gnd pin
set_property src_info {type:XDC file:1 line:32 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U2    IOSTANDARD LVCMOS33 } [get_ports { duty[5] }]; #IO_L9N_T1_DQS_34 Sch=pio[42]
set_property src_info {type:XDC file:1 line:33 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33 } [get_ports { duty[6] }]; #IO_L13N_T2_MRCC_34 Sch=pio[43]
set_property src_info {type:XDC file:1 line:34 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports { duty[7] }]; #IO_L9P_T1_DQS_34 Sch=pio[44]
