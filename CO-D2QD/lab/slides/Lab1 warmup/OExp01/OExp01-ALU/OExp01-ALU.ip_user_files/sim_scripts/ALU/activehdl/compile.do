vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xlslice_v1_0_1
vlib activehdl/xlconstant_v1_1_3
vlib activehdl/xlconcat_v2_1_1

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xlslice_v1_0_1 activehdl/xlslice_v1_0_1
vmap xlconstant_v1_1_3 activehdl/xlconstant_v1_1_3
vmap xlconcat_v2_1_1 activehdl/xlconcat_v2_1_1

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/ALU/ipshared/8893/MUX8T1_32.v" \
"../../../bd/ALU/ip/ALU_MUX8T1_32_0_0/sim/ALU_MUX8T1_32_0_0.v" \
"../../../bd/ALU/ipshared/69d3/addc_32.v" \
"../../../bd/ALU/ip/ALU_addc_32_0_0/sim/ALU_addc_32_0_0.v" \
"../../../bd/ALU/ipshared/2f3b/and32.v" \
"../../../bd/ALU/ip/ALU_and32_0_0/sim/ALU_and32_0_0.v" \
"../../../bd/ALU/ipshared/326e/or32.v" \
"../../../bd/ALU/ip/ALU_or32_0_0/sim/ALU_or32_0_0.v" \
"../../../bd/ALU/ipshared/21e4/xor32.v" \
"../../../bd/ALU/ip/ALU_xor32_0_0/sim/ALU_xor32_0_0.v" \
"../../../bd/ALU/ipshared/6e8d/nor32.v" \
"../../../bd/ALU/ip/ALU_nor32_0_0/sim/ALU_nor32_0_0.v" \
"../../../bd/ALU/ip/ALU_xor32_0_1/sim/ALU_xor32_0_1.v" \
"../../../bd/ALU/ipshared/d0ad/srl32.v" \
"../../../bd/ALU/ip/ALU_srl32_0_0/sim/ALU_srl32_0_0.v" \
"../../../bd/ALU/ipshared/f261/or_bit_32.v" \
"../../../bd/ALU/ip/ALU_or_bit_32_0_0/sim/ALU_or_bit_32_0_0.v" \
"../../../bd/ALU/ipshared/d8f1/SignalExt_32.v" \
"../../../bd/ALU/ip/ALU_SignalExt_32_0_0/sim/ALU_SignalExt_32_0_0.v" \

vlog -work xlslice_v1_0_1  -v2k5 \
"../../../../OExp04-ALU.srcs/sources_1/bd/ALU/ipshared/f3db/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/ALU/ip/ALU_xlslice_0_0/sim/ALU_xlslice_0_0.v" \
"../../../bd/ALU/ip/ALU_xlslice_1_0/sim/ALU_xlslice_1_0.v" \
"../../../bd/ALU/ip/ALU_xlslice_2_0/sim/ALU_xlslice_2_0.v" \

vlog -work xlconstant_v1_1_3  -v2k5 \
"../../../../OExp04-ALU.srcs/sources_1/bd/ALU/ipshared/0750/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/ALU/ip/ALU_xlconstant_0_0/sim/ALU_xlconstant_0_0.v" \

vlog -work xlconcat_v2_1_1  -v2k5 \
"../../../../OExp04-ALU.srcs/sources_1/bd/ALU/ipshared/2f66/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/ALU/ip/ALU_xlconcat_0_0/sim/ALU_xlconcat_0_0.v" \
"../../../bd/ALU/sim/ALU.v" \

vlog -work xil_defaultlib \
"glbl.v"

