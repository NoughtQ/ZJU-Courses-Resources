
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:072

00:00:182	
485.5002	
180.234Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental D:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/utils_1/imports/synth_1/Top.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2o
mD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/utils_1/imports/synth_1/Top.dcpZ12-5825h px� 
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
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
M
#Helper process launched with PID %s4824*oasys2
3580Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:17 . Memory (MB): peak = 1348.871 ; gain = 438.113
h px� 
�
*overwriting previous definition of %s '%s'6131*oasys2
module2
FD2]
YD:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/circuit/FD.v2
168@Z8-9873h px� 
�
2previous definition of design element '%s' is here6195*oasys2
FD22
.D:/Vivado/2023.2/scripts/rt/data/unisim_comp.v2	
407738@Z8-9937h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
clk_1s2
wire2e
aD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/sources_1/new/Top.v2
158@Z8-11241h px� 
�
synthesizing module '%s'%s4497*oasys2
Top2
 2e
aD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/sources_1/new/Top.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
clk_1s2
 2h
dD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/sources_1/new/clk_1s.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
clk_1s2
 2
02
12h
dD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/sources_1/new/clk_1s.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	Counter4b2
 2d
`D:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/circuit/Counter4b.v2
98@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
NOR_GATE_3_INPUTS2
 2j
fD:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/gates/NOR_GATE_3_INPUTS.v2
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
NOR_GATE_3_INPUTS2
 2
02
12j
fD:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/gates/NOR_GATE_3_INPUTS.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
XOR_GATE_ONEHOT2
 2h
dD:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/gates/XOR_GATE_ONEHOT.v2
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
12h
dD:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/gates/XOR_GATE_ONEHOT.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

NOR_GATE2
 2a
]D:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/gates/NOR_GATE.v2
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

NOR_GATE2
 2
02
12a
]D:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/gates/NOR_GATE.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
NOR_GATE_4_INPUTS2
 2j
fD:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/gates/NOR_GATE_4_INPUTS.v2
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
NOR_GATE_4_INPUTS2
 2
02
12j
fD:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/gates/NOR_GATE_4_INPUTS.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
FD2
 2]
YD:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/circuit/FD.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
FD2
 2
02
12]
YD:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/circuit/FD.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	Counter4b2
 2
02
12d
`D:/University/CS/major-courses/dld/lab/reports/lab10/lab10/Counter4b/verilog/circuit/Counter4b.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
DispNum2
 2^
ZD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DispNum/verilog/circuit/DispNum.v2
98@Z8-6157h px� 
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
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	MyMC144952
 2
02
12f
bD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/MyMC14495.v2
98@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
DispNum2
 2
02
12^
ZD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DispNum/verilog/circuit/DispNum.v2
98@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
BTN_X2	
DispNum2	
display2e
aD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/sources_1/new/Top.v2
308@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2	
display2	
DispNum2
52
42e
aD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/sources_1/new/Top.v2
308@Z8-7023h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Top2
 2
02
12e
aD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/sources_1/new/Top.v2
18@Z8-6155h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:10 ; elapsed = 00:00:23 . Memory (MB): peak = 1456.852 ; gain = 546.094
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:10 ; elapsed = 00:00:23 . Memory (MB): peak = 1456.852 ; gain = 546.094
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
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:10 ; elapsed = 00:00:23 . Memory (MB): peak = 1456.852 ; gain = 546.094
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

1456.8522
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
179*designutils2p
lD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/constrs_1/new/constraints1.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2p
lD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/constrs_1/new/constraints1.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2n
lD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/constrs_1/new/constraints1.xdc2
.Xil/Top_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1549.8092
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
00:00:00.0062

1549.8092
0.000Z17-268h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:22 ; elapsed = 00:00:46 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:23 ; elapsed = 00:00:46 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:23 ; elapsed = 00:00:46 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
7
%s
*synth2
Start Preparing Guide Design
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
�
�The reference checkpoint %s is not suitable for use with incremental synthesis for this design. Please regenerate the checkpoint for this design with -incremental_synth switch in the same Vivado session that synth_design has been run. Synthesis will continue with the default flow4740*oasys2o
mD:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.srcs/utils_1/imports/synth_1/Top.dcpZ8-6895h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Doing Graph Differ : Time (s): cpu = 00:00:23 ; elapsed = 00:00:47 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
�Finished Preparing Guide Design : Time (s): cpu = 00:00:23 ; elapsed = 00:00:47 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:23 ; elapsed = 00:00:47 . Memory (MB): peak = 1549.809 ; gain = 639.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
C
%s
*synth2+
)

Incremental Synthesis Report Summary:

h p
x
� 
<
%s
*synth2$
"1. Incremental synthesis run: no

h p
x
� 
O
%s
*synth27
5   Reason for not running incremental synthesis : 


h p
x
� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}4868*oasysZ8-7130h px� 
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
.	                1 Bit    Registers := 5     
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
g
+design %s has port %s driven by constant %s3447*oasys2
Top2

SEGMENT[7]2
1Z8-3917h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:26 ; elapsed = 00:00:54 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:33 ; elapsed = 00:01:11 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
}Finished Timing Optimization : Time (s): cpu = 00:00:33 ; elapsed = 00:01:11 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
|Finished Technology Mapping : Time (s): cpu = 00:00:33 ; elapsed = 00:01:11 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
vFinished IO Insertion : Time (s): cpu = 00:00:38 ; elapsed = 00:01:24 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:38 ; elapsed = 00:01:24 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:38 ; elapsed = 00:01:24 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:38 ; elapsed = 00:01:24 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:38 ; elapsed = 00:01:24 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:38 ; elapsed = 00:01:24 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
|2     |CARRY4 |     7|
h px� 
2
%s*synth2
|3     |LUT1   |     2|
h px� 
2
%s*synth2
|4     |LUT2   |     1|
h px� 
2
%s*synth2
|5     |LUT3   |     1|
h px� 
2
%s*synth2
|6     |LUT4   |    11|
h px� 
2
%s*synth2
|7     |LUT5   |     2|
h px� 
2
%s*synth2
|8     |LUT6   |     3|
h px� 
2
%s*synth2
|9     |FDRE   |    31|
h px� 
2
%s*synth2
|10    |IBUF   |     1|
h px� 
2
%s*synth2
|11    |OBUF   |    13|
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
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:38 ; elapsed = 00:01:24 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
FSynthesis finished with 0 errors, 1 critical warnings and 2 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:25 ; elapsed = 00:01:18 . Memory (MB): peak = 1549.809 ; gain = 546.094
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:38 ; elapsed = 00:01:24 . Memory (MB): peak = 1549.809 ; gain = 639.051
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
00:00:00.0012

1549.8092
0.000Z17-268h px� 
S
-Analyzing %s Unisim elements for replacement
17*netlist2
7Z29-17h px� 
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

00:00:002
00:00:00.0012

1549.8092
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

db9a0854Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
522
42
22
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:432

00:01:412

1549.8092

1060.340Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0032

1549.8092
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2_
]D:/University/CS/major-courses/dld/lab/reports/lab10/MyCounter/MyCounter.runs/synth_1/Top.dcpZ17-1381h px� 
z
%s4*runtcl2^
\Executing : report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu May  9 14:13:45 2024Z17-206h px� 


End Record