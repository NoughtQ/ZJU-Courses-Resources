
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:082

00:00:132	
485.8552	
182.645Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/utils_1/imports/synth_1/ALU.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2c
aD:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/utils_1/imports/synth_1/ALU.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
`
Command: %s
53*	vivadotcl2/
-synth_design -top Top -part xc7k160tffg676-2LZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7k160tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7k160tZ17-349h px� 
F
Loading part %s157*device2
xc7k160tffg676-2LZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
M
#Helper process launched with PID %s4824*oasys2
7100Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:13 . Memory (MB): peak = 1349.730 ; gain = 440.895
h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
a2
wire2i
eD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/Hex2Seg.v2
118@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
b2
wire2i
eD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/Hex2Seg.v2
118@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
c2
wire2i
eD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/Hex2Seg.v2
118@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
d2
wire2i
eD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/Hex2Seg.v2
118@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
e2
wire2i
eD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/Hex2Seg.v2
118@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
f2
wire2i
eD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/Hex2Seg.v2
118@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
g2
wire2i
eD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/Hex2Seg.v2
118@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
p2
wire2i
eD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/Hex2Seg.v2
118@Z8-11241h px� 
�
synthesizing module '%s'%s4497*oasys2
Top2
 2Y
UD:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/top.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
clkdiv2
 2\
XD:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/clkdiv.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
clkdiv2
 2
02
12\
XD:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/clkdiv.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

pbdebounce2
 2`
\D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/pbdebounce.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

pbdebounce2
 2
02
12`
\D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/pbdebounce.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CreateNumber2
 2b
^D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/CreateNumber.v2
118@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

AddSub4b2
 2\
XD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/AddSub4b.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
XOR_GATE_ONEHOT2
 2a
]D:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/gates/XOR_GATE_ONEHOT.v2
98@Z8-6157h px� 
�
%s
*synth2j
h	Parameter BubblesMask bound to: 65'b00000000000000000000000000000000000000000000000000000000000000000 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
XOR_GATE_ONEHOT2
 2
02
12a
]D:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/gates/XOR_GATE_ONEHOT.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
Adder1b2
 2[
WD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/Adder1b.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

AND_GATE2
 2Z
VD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/gates/AND_GATE.v2
98@Z8-6157h px� 
�
%s
*synth2j
h	Parameter BubblesMask bound to: 65'b00000000000000000000000000000000000000000000000000000000000000000 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

AND_GATE2
 2
02
12Z
VD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/gates/AND_GATE.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
OR_GATE_3_INPUTS2
 2b
^D:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/gates/OR_GATE_3_INPUTS.v2
98@Z8-6157h px� 
�
%s
*synth2j
h	Parameter BubblesMask bound to: 65'b00000000000000000000000000000000000000000000000000000000000000000 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
OR_GATE_3_INPUTS2
 2
02
12b
^D:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/gates/OR_GATE_3_INPUTS.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Adder1b2
 2
02
12[
WD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/Adder1b.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

AddSub4b2
 2
02
12\
XD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/AddSub4b.v2
98@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
Cout2

AddSub4b2
a02b
^D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/CreateNumber.v2
238@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
a02

AddSub4b2
52
42b
^D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/CreateNumber.v2
238@Z8-7023h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
Cout2

AddSub4b2
a12b
^D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/CreateNumber.v2
248@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
a12

AddSub4b2
52
42b
^D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/CreateNumber.v2
248@Z8-7023h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
Cout2

AddSub4b2
a22b
^D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/CreateNumber.v2
258@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
a22

AddSub4b2
52
42b
^D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/CreateNumber.v2
258@Z8-7023h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
Cout2

AddSub4b2
a32b
^D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/CreateNumber.v2
268@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
a32

AddSub4b2
52
42b
^D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/CreateNumber.v2
268@Z8-7023h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CreateNumber2
 2
02
12b
^D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/CreateNumber.v2
118@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ALU2
 2W
SD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/ALU.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
	Mux4to1b42
 2]
YD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/Mux4to1b4.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2	
Mux4to12
 2[
WD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/Mux4to1.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
OR_GATE_4_INPUTS2
 2b
^D:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/gates/OR_GATE_4_INPUTS.v2
98@Z8-6157h px� 
�
%s
*synth2j
h	Parameter BubblesMask bound to: 65'b00000000000000000000000000000000000000000000000000000000000000000 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
OR_GATE_4_INPUTS2
 2
02
12b
^D:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/gates/OR_GATE_4_INPUTS.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Mux4to12
 2
02
12[
WD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/Mux4to1.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	Mux4to1b42
 2
02
12]
YD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/Mux4to1b4.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
And2b42
 2Z
VD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/And2b4.v2
98@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
And2b42
 2
02
12Z
VD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/And2b4.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Or2b42
 2Y
UD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/Or2b4.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2	
OR_GATE2
 2Y
UD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/gates/OR_GATE.v2
98@Z8-6157h px� 
�
%s
*synth2j
h	Parameter BubblesMask bound to: 65'b00000000000000000000000000000000000000000000000000000000000000000 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
OR_GATE2
 2
02
12Y
UD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/gates/OR_GATE.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Or2b42
 2
02
12Y
UD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/Or2b4.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ALU2
 2
02
12W
SD:/University/CS/major-courses/dld/labs/reports/lab8/lab8/ALU/verilog/circuit/ALU.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
DisplayNumber2
 2k
gD:/University/CS/major-courses/dld/labs/reports/lab7/lab7/DisplayNumber/verilog/circuit/DisplayNumber.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
DisplaySync2
 2i
eD:/University/CS/major-courses/dld/labs/reports/lab7/lab7/DisplayNumber/verilog/circuit/DisplaySync.v2
98@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
DisplaySync2
 2
02
12i
eD:/University/CS/major-courses/dld/labs/reports/lab7/lab7/DisplayNumber/verilog/circuit/DisplaySync.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	MyMC144952
 2g
cD:/University/CS/major-courses/dld/labs/reports/lab7/lab7/DisplayNumber/verilog/circuit/MyMC14495.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
AND_GATE_3_INPUTS2
 2m
iD:/University/CS/major-courses/dld/labs/reports/lab7/lab7/DisplayNumber/verilog/gates/AND_GATE_3_INPUTS.v2
98@Z8-6157h px� 
�
%s
*synth2j
h	Parameter BubblesMask bound to: 65'b00000000000000000000000000000000000000000000000000000000000000000 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
AND_GATE_3_INPUTS2
 2
02
12m
iD:/University/CS/major-courses/dld/labs/reports/lab7/lab7/DisplayNumber/verilog/gates/AND_GATE_3_INPUTS.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
AND_GATE_4_INPUTS2
 2m
iD:/University/CS/major-courses/dld/labs/reports/lab7/lab7/DisplayNumber/verilog/gates/AND_GATE_4_INPUTS.v2
98@Z8-6157h px� 
�
%s
*synth2j
h	Parameter BubblesMask bound to: 65'b00000000000000000000000000000000000000000000000000000000000000000 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
AND_GATE_4_INPUTS2
 2
02
12m
iD:/University/CS/major-courses/dld/labs/reports/lab7/lab7/DisplayNumber/verilog/gates/AND_GATE_4_INPUTS.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	MyMC144952
 2
02
12g
cD:/University/CS/major-courses/dld/labs/reports/lab7/lab7/DisplayNumber/verilog/circuit/MyMC14495.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
DisplayNumber2
 2
02
12k
gD:/University/CS/major-courses/dld/labs/reports/lab7/lab7/DisplayNumber/verilog/circuit/DisplayNumber.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

SSeg_Dev2
 2j
fD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/SSeg_Dev.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
P2S2
 2_
[D:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/P2S_io.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
P2S2
 2
02
12_
[D:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/P2S_io.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	HexTo8SEG2
 2k
gD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/HexTo8SEG.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2	
Hex2Seg2
 2i
eD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/Hex2Seg.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Hex2Seg2
 2
02
12i
eD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/Hex2Seg.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	HexTo8SEG2
 2
02
12k
gD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/HexTo8SEG.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

SSeg_Dev2
 2
02
12j
fD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/SSeg_Dev/SSeg_Dev.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Top2
 2
02
12Y
UD:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/top.v2
18@Z8-6155h px� 
b
+design %s has port %s driven by constant %s3447*oasys2
Top2
BTNX42
0Z8-3917h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:16 . Memory (MB): peak = 1459.234 ; gain = 550.398
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:17 . Memory (MB): peak = 1459.234 ; gain = 550.398
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:17 . Memory (MB): peak = 1459.234 ; gain = 550.398
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0122

1459.2342
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2c
_D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/constrs_1/new/constraints.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2c
_D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/constrs_1/new/constraints.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2a
_D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/constrs_1/new/constraints.xdc2
.Xil/Top_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0032

1512.0392
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0262

1512.0392
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:13 ; elapsed = 00:00:28 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Loading part: xc7k160tffg676-2L
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:13 ; elapsed = 00:00:28 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:28 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:13 ; elapsed = 00:00:28 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 2     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 4     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
s
%s
*synth2[
YPart Resources:
DSPs: 600 (col length:100)
BRAMs: 650 (col length: RAMB18 100 RAMB36 50)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2
m0/pbshift_reg2
82
72`
\D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/pbdebounce.v2
108@Z8-3936h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2
m1/pbshift_reg2
82
72`
\D:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.srcs/sources_1/new/pbdebounce.v2
108@Z8-3936h px� 
b
+design %s has port %s driven by constant %s3447*oasys2
Top2
BTNX42
0Z8-3917h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:15 ; elapsed = 00:00:33 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:19 ; elapsed = 00:00:41 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:42 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:20 ; elapsed = 00:00:42 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:23 ; elapsed = 00:00:48 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:23 ; elapsed = 00:00:48 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:23 ; elapsed = 00:00:48 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:23 ; elapsed = 00:00:48 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:23 ; elapsed = 00:00:48 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:23 ; elapsed = 00:00:48 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|      |BlackBox name |Instances |
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|1     |P2S           |         1|
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |P2S    |     1|
h px� 
2
%s*synth2
|2     |BUFG   |     1|
h px� 
2
%s*synth2
|3     |CARRY4 |     7|
h px� 
2
%s*synth2
|4     |LUT1   |     7|
h px� 
2
%s*synth2
|5     |LUT2   |    10|
h px� 
2
%s*synth2
|6     |LUT3   |     3|
h px� 
2
%s*synth2
|7     |LUT4   |     8|
h px� 
2
%s*synth2
|8     |LUT5   |     5|
h px� 
2
%s*synth2
|9     |LUT6   |    29|
h px� 
2
%s*synth2
|10    |FDRE   |    50|
h px� 
2
%s*synth2
|11    |IBUF   |    19|
h px� 
2
%s*synth2
|12    |OBUF   |    17|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:23 ; elapsed = 00:00:48 . Memory (MB): peak = 1512.039 ; gain = 603.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 4 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:13 ; elapsed = 00:00:45 . Memory (MB): peak = 1512.039 ; gain = 550.398
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:23 ; elapsed = 00:00:48 . Memory (MB): peak = 1512.039 ; gain = 603.203
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
Parsing EDIF File [%s]
106*designutils2\
ZD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/P2S.edfZ20-106h px� 
�
 Finished Parsing EDIF File [%s]
97*designutils2\
ZD:/University/CS/major-courses/dld/labs/reports/lab8/attachment-seg/attachment-seg/P2S.edfZ20-97h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0022

1512.0392
0.000Z17-268h px� 
S
-Analyzing %s Unisim elements for replacement
17*netlist2
7Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
T
Netlist was created with %s %s291*project2
Vivado2
2022.2Z1-479h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[0]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[10]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[11]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[12]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[13]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[14]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[15]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[16]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[17]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[18]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[19]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[1]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[20]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[21]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[22]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[23]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[24]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[25]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[26]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[27]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[28]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[29]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[2]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[30]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[31]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[32]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[33]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[34]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[35]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[36]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[37]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[38]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[39]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[3]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[40]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[41]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[42]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[43]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[44]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[45]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[46]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[47]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[48]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[49]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[4]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[50]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[51]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[52]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[53]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[54]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[55]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[56]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[57]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[58]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[59]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[5]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[60]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[61]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[62]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[63]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[6]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[7]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[8]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/P_Data_IBUF[9]_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/Serial_IBUF_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/clk_IBUF_instZ31-32h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt2
m7/M2/rst_IBUF_instZ31-32h px� 
�
LRemoving redundant OBUF, %s, from the path connected to top-level port: %s 
36*opt2
SEG_PEN_OBUF_inst2	
SEG_PENZ31-36h px� 
�
LRemoving redundant OBUF, %s, from the path connected to top-level port: %s 
36*opt2
seg_sout_OBUF_inst2

seg_soutZ31-36h px� 
�
LRemoving redundant OBUF, %s, from the path connected to top-level port: %s 
36*opt2
seg_clrn_OBUF_inst2

seg_clrnZ31-36h px� 
�
LRemoving redundant OBUF, %s, from the path connected to top-level port: %s 
36*opt2
seg_clk_OBUF_inst2	
seg_clkZ31-36h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1512.0392
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

677c3439Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
802
842
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:282

00:01:002

1512.0392

1023.211Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

1512.0392
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2S
QD:/University/CS/major-courses/dld/labs/reports/lab8/ALU/ALU.runs/synth_1/Top.dcpZ17-1381h px� 
z
%s4*runtcl2^
\Executing : report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu Apr 25 13:20:08 2024Z17-206h px� 


End Record