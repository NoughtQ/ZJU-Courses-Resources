
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:092

00:00:142	
485.5312	
179.895Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental D:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/utils_1/imports/synth_1/top.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2g
eD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/utils_1/imports/synth_1/top.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
`
Command: %s
53*	vivadotcl2/
-synth_design -top top -part xc7k160tffg676-2LZ4-113h px� 
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
N
#Helper process launched with PID %s4824*oasys2
22296Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:11 . Memory (MB): peak = 1352.016 ; gain = 440.391
h px� 
�
synthesizing module '%s'%s4497*oasys2
top2
 2]
YD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/top.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

clk_10ms2
 2b
^D:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/clk_10ms.v2
28@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

clk_10ms2
 2
02
12b
^D:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/clk_10ms.v2
28@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	clk_100ms2
 2c
_D:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/clk_100ms.v2
28@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	clk_100ms2
 2
02
12c
_D:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/clk_100ms.v2
28@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	My74LS1612
 2c
_D:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/My74LS161.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	My74LS1612
 2
02
12c
_D:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/My74LS161.v2
18@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
CO2
	My74LS1612
m12]
YD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/top.v2
238@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
m12
	My74LS1612
82
72]
YD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/top.v2
238@Z8-7023h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
CO2
	My74LS1612
m22]
YD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/top.v2
268@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
m22
	My74LS1612
82
72]
YD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/top.v2
268@Z8-7023h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
CO2
	My74LS1612
m32]
YD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/top.v2
298@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
m32
	My74LS1612
82
72]
YD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/top.v2
298@Z8-7023h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
CO2
	My74LS1612
m42]
YD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/top.v2
328@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
m42
	My74LS1612
82
72]
YD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/top.v2
328@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2
DisplayNumber2
 2j
fD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/DisplayNumber.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
clkdiv2
 2c
_D:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/clkdiv.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
clkdiv2
 2
02
12c
_D:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/clkdiv.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
DisplaySync2
 2h
dD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/DisplaySync.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2	
Mux4to12
 2d
`D:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/Mux4to1.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

AND_GATE2
 2c
_D:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/AND_GATE.v2
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
12c
_D:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/AND_GATE.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
OR_GATE_4_INPUTS2
 2k
gD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/OR_GATE_4_INPUTS.v2
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
12k
gD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/OR_GATE_4_INPUTS.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Mux4to12
 2
02
12d
`D:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/Mux4to1.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	Mux4to1b42
 2f
bD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/Mux4to1b4.v2
98@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	Mux4to1b42
 2
02
12f
bD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/Mux4to1b4.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
DisplaySync2
 2
02
12h
dD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/DisplaySync.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	MyMC144952
 2f
bD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/MyMC14495.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
AND_GATE_3_INPUTS2
 2l
hD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/AND_GATE_3_INPUTS.v2
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
12l
hD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/AND_GATE_3_INPUTS.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
OR_GATE_3_INPUTS2
 2k
gD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/OR_GATE_3_INPUTS.v2
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
12k
gD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/OR_GATE_3_INPUTS.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
AND_GATE_4_INPUTS2
 2l
hD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/AND_GATE_4_INPUTS.v2
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
12l
hD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/AND_GATE_4_INPUTS.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
OR_GATE2
 2b
^D:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/OR_GATE.v2
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
12b
^D:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/gates/OR_GATE.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	MyMC144952
 2
02
12f
bD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/MyMC14495.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
DisplayNumber2
 2
02
12j
fD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/DisplayNumber.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
top2
 2
02
12]
YD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/sources_1/new/top.v2
18@Z8-6155h px� 
k
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[1]2
topZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:14 . Memory (MB): peak = 1460.617 ; gain = 548.992
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:14 . Memory (MB): peak = 1460.617 ; gain = 548.992
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
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:14 . Memory (MB): peak = 1460.617 ; gain = 548.992
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
00:00:00.0032

1460.6172
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
179*designutils2g
cD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/constrs_1/new/constraints.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2g
cD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/constrs_1/new/constraints.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2e
cD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.srcs/constrs_1/new/constraints.xdc2
.Xil/top_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1570.2772
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
00:00:00.0052

1570.2772
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
Finished Constraint Validation : Time (s): cpu = 00:00:14 ; elapsed = 00:00:25 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:14 ; elapsed = 00:00:25 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:14 ; elapsed = 00:00:26 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:14 ; elapsed = 00:00:26 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 4     
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
,	   2 Input    4 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 5     
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
k
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[1]2
topZ8-7129h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:15 ; elapsed = 00:00:29 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:20 ; elapsed = 00:00:37 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
}Finished Timing Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:38 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
|Finished Technology Mapping : Time (s): cpu = 00:00:20 ; elapsed = 00:00:38 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
vFinished IO Insertion : Time (s): cpu = 00:00:25 ; elapsed = 00:00:44 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:25 ; elapsed = 00:00:44 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:25 ; elapsed = 00:00:44 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:25 ; elapsed = 00:00:44 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:25 ; elapsed = 00:00:44 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:25 ; elapsed = 00:00:44 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
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
|1     |BUFG   |     1|
h px� 
2
%s*synth2
|2     |CARRY4 |    16|
h px� 
2
%s*synth2
|3     |LUT1   |     5|
h px� 
2
%s*synth2
|4     |LUT2   |     6|
h px� 
2
%s*synth2
|5     |LUT3   |     8|
h px� 
2
%s*synth2
|6     |LUT4   |    17|
h px� 
2
%s*synth2
|7     |LUT5   |     4|
h px� 
2
%s*synth2
|8     |LUT6   |    10|
h px� 
2
%s*synth2
|9     |FDRE   |    79|
h px� 
2
%s*synth2
|10    |IBUF   |     2|
h px� 
2
%s*synth2
|11    |OBUF   |    12|
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
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:25 ; elapsed = 00:00:44 . Memory (MB): peak = 1570.277 ; gain = 658.652
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
FSynthesis finished with 0 errors, 0 critical warnings and 2 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:15 ; elapsed = 00:00:41 . Memory (MB): peak = 1570.277 ; gain = 548.992
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:25 ; elapsed = 00:00:44 . Memory (MB): peak = 1570.277 ; gain = 658.652
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0032

1570.2772
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
16Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1570.2772
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

856736c4Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
532
112
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

00:00:312

00:00:562

1570.2772

1080.750Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

1570.2772
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2W
UD:/University/CS/major-courses/dld/lab/lab12/My74LS161/My74LS161.runs/synth_1/top.dcpZ17-1381h px� 
z
%s4*runtcl2^
\Executing : report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu May 23 14:23:22 2024Z17-206h px� 


End Record