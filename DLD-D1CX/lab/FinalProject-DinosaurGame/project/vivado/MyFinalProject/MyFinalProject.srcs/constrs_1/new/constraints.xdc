# Filename: constraints.xdc
## Constraints file for MyFinalProject

# Main clock
set_property PACKAGE_PIN AC18 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports clk]

create_clock -period 10.000 -name clk [get_ports "clk"]

set_property PACKAGE_PIN W13 [get_ports {rstn}]
set_property IOSTANDARD LVCMOS18 [get_ports {rstn}]

set_property PACKAGE_PIN AA10 [get_ports {SW[0]}]
set_property PACKAGE_PIN AB10 [get_ports {SW[1]}]
set_property PACKAGE_PIN AA13 [get_ports {SW[2]}]
set_property PACKAGE_PIN AA12 [get_ports {SW[3]}]
set_property PACKAGE_PIN Y13 [get_ports {SW[4]}]
set_property PACKAGE_PIN Y12 [get_ports {SW[5]}]
set_property PACKAGE_PIN AD11 [get_ports {SW[6]}]
set_property PACKAGE_PIN AD10 [get_ports {SW[7]}]
set_property PACKAGE_PIN AE10 [get_ports {SW[8]}]
set_property PACKAGE_PIN AE12 [get_ports {SW[9]}]
set_property PACKAGE_PIN AF12 [get_ports {SW[10]}]
set_property PACKAGE_PIN AE8 [get_ports {SW[11]}]
set_property PACKAGE_PIN AF8 [get_ports {SW[12]}]
set_property PACKAGE_PIN AE13 [get_ports {SW[13]}]
set_property PACKAGE_PIN AF13 [get_ports {SW[14]}]
set_property PACKAGE_PIN AF10 [get_ports {SW[15]}]

set_property IOSTANDARD LVCMOS15 [get_ports {SW[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[4]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[5]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[6]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[7]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[8]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[9]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[10]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[11]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[12]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[13]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[14]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[15]}]

# LED
set_property PACKAGE_PIN AF24 [get_ports {buzzer}]
set_property IOSTANDARD LVCMOS33 [get_ports {buzzer}]

set_property PACKAGE_PIN AD21 [get_ports {AN[0]}]
set_property PACKAGE_PIN AC21 [get_ports {AN[1]}]
set_property PACKAGE_PIN AB21 [get_ports {AN[2]}]
set_property PACKAGE_PIN AC22 [get_ports {AN[3]}]
set_property PACKAGE_PIN AB22 [get_ports {SEGMENT[0]}]
set_property PACKAGE_PIN AD24 [get_ports {SEGMENT[1]}]
set_property PACKAGE_PIN AD23 [get_ports {SEGMENT[2]}]
set_property PACKAGE_PIN Y21 [get_ports {SEGMENT[3]}]
set_property PACKAGE_PIN W20 [get_ports {SEGMENT[4]}]
set_property PACKAGE_PIN AC24 [get_ports {SEGMENT[5]}]
set_property PACKAGE_PIN AC23 [get_ports {SEGMENT[6]}]
set_property PACKAGE_PIN AA22 [get_ports {SEGMENT[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[7]}]

set_property PACKAGE_PIN M24 [get_ports {SEGLED_CLK}]
set_property PACKAGE_PIN M20 [get_ports {SEGLED_CLR}]
set_property PACKAGE_PIN L24 [get_ports {SEGLED_DO}]
set_property PACKAGE_PIN R18 [get_ports {SEGLED_PEN}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGLED_CLK}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGLED_CLR}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGLED_DO}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGLED_PEN}]

set_property PACKAGE_PIN N26 [get_ports {LED_CLK}]
set_property PACKAGE_PIN N24 [get_ports {LED_CLR}]
set_property PACKAGE_PIN M26 [get_ports {LED_DO}]
set_property PACKAGE_PIN P18 [get_ports {LED_PEN}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_CLK}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_CLR}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_DO}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_PEN}]

set_property PACKAGE_PIN AF24 [get_ports {LED[0]}]
set_property PACKAGE_PIN AE21 [get_ports {LED[1]}]
set_property PACKAGE_PIN Y22 [get_ports {LED[2]}]
set_property PACKAGE_PIN Y23 [get_ports {LED[3]}]
set_property PACKAGE_PIN AA23 [get_ports {LED[4]}]
set_property PACKAGE_PIN Y25 [get_ports {LED[5]}]
set_property PACKAGE_PIN AB26 [get_ports {LED[6]}]
set_property PACKAGE_PIN W23 [get_ports {LED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]

set_property PACKAGE_PIN V17 [get_ports {BTN_X[0]}]
set_property PACKAGE_PIN W18 [get_ports {BTN_X[1]}]
set_property PACKAGE_PIN W19 [get_ports {BTN_X[2]}]
set_property PACKAGE_PIN W15 [get_ports {BTN_X[3]}]
set_property PACKAGE_PIN W16 [get_ports {BTN_X[4]}]
set_property PACKAGE_PIN V18 [get_ports {BTN_Y[0]}]
set_property PACKAGE_PIN V19 [get_ports {BTN_Y[1]}]
set_property PACKAGE_PIN V14 [get_ports {BTN_Y[2]}]
set_property PACKAGE_PIN W14 [get_ports {BTN_Y[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_X[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_X[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_X[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_X[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_X[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_Y[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_Y[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_Y[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_Y[3]}]

set_property PACKAGE_PIN T20 [get_ports {b[0]}]
set_property PACKAGE_PIN R20 [get_ports {b[1]}]
set_property PACKAGE_PIN T22 [get_ports {b[2]}]
set_property PACKAGE_PIN T23 [get_ports {b[3]}]
set_property PACKAGE_PIN R22 [get_ports {g[0]}]
set_property PACKAGE_PIN R23 [get_ports {g[1]}]
set_property PACKAGE_PIN T24 [get_ports {g[2]}]
set_property PACKAGE_PIN T25 [get_ports {g[3]}]
set_property PACKAGE_PIN N21 [get_ports {r[0]}]
set_property PACKAGE_PIN N22 [get_ports {r[1]}]
set_property PACKAGE_PIN R21 [get_ports {r[2]}]
set_property PACKAGE_PIN P21 [get_ports {r[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[3]}]

set_property PACKAGE_PIN M22 [get_ports {hs}]
set_property PACKAGE_PIN M21 [get_ports {vs}]
set_property IOSTANDARD LVCMOS33 [get_ports {hs}]
set_property IOSTANDARD LVCMOS33 [get_ports {vs}]

set_property PACKAGE_PIN N18 [get_ports {ps2_clk}]
set_property PACKAGE_PIN M19 [get_ports {ps2_data}]
set_property IOSTANDARD LVCMOS33 [get_ports {ps2_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {ps2_data}]