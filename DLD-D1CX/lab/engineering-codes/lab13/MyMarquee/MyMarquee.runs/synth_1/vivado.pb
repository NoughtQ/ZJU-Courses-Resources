
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:042

00:00:092	
487.2972	
179.539Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental D:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/utils_1/imports/synth_1/Top.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2o
mD:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/utils_1/imports/synth_1/Top.dcpZ12-5825h px� 
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
N
#Helper process launched with PID %s4824*oasys2
22788Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:07 . Memory (MB): peak = 1351.418 ; gain = 440.203
h px� 
�
*overwriting previous definition of %s '%s'6131*oasys2
module2
FD2f
bD:/University/CS/major-courses/dld/lab/reports/lab13/ShiftReg8b/ShiftReg8b.srcs/sources_1/new/FD.v2
168@Z8-9873h px� 
�
2previous definition of design element '%s' is here6195*oasys2
FD22
.D:/Vivado/2023.2/scripts/rt/data/unisim_comp.v2	
407738@Z8-9937h px� 
�
synthesizing module '%s'%s4497*oasys2
Top2
 2e
aD:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/sources_1/new/Top.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
clk_1s2
 2h
dD:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/sources_1/new/clk_1s.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
clk_1s2
 2
02
12h
dD:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/sources_1/new/clk_1s.v2
38@Z8-6155h px� 
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
synthesizing module '%s'%s4497*oasys2
CreateNumber2
 2n
jD:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/sources_1/new/CreateNumber.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CreateNumber2
 2
02
12n
jD:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/sources_1/new/CreateNumber.v2
18@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
82
num2
162
CreateNumber2e
aD:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/sources_1/new/Top.v2
198@Z8-689h px� 
�
synthesizing module '%s'%s4497*oasys2

ShiftReg8b2
 2n
jD:/University/CS/major-courses/dld/lab/reports/lab13/ShiftReg8b/ShiftReg8b.srcs/sources_1/new/ShiftReg8b.v2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
	Inputgate2
 2m
iD:/University/CS/major-courses/dld/lab/reports/lab13/ShiftReg8b/ShiftReg8b.srcs/sources_1/new/InputGate.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	Inputgate2
 2
02
12m
iD:/University/CS/major-courses/dld/lab/reports/lab13/ShiftReg8b/ShiftReg8b.srcs/sources_1/new/InputGate.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
FD2
 2f
bD:/University/CS/major-courses/dld/lab/reports/lab13/ShiftReg8b/ShiftReg8b.srcs/sources_1/new/FD.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
FD2
 2
02
12f
bD:/University/CS/major-courses/dld/lab/reports/lab13/ShiftReg8b/ShiftReg8b.srcs/sources_1/new/FD.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

ShiftReg8b2
 2
02
12n
jD:/University/CS/major-courses/dld/lab/reports/lab13/ShiftReg8b/ShiftReg8b.srcs/sources_1/new/ShiftReg8b.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
DisplayNumber2
 2j
fD:/University/CS/major-courses/dld/lab/reports/lab7/lab7/DisplayNumber/verilog/circuit/DisplayNumber.v2
98@Z8-6157h px� 
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
synthesizing module '%s'%s4497*oasys2

pbdebounce2
 2l
hD:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/sources_1/new/pbdebounce.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

pbdebounce2
 2
02
12l
hD:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/sources_1/new/pbdebounce.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Top2
 2
02
12e
aD:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.srcs/sources_1/new/Top.v2
18@Z8-6155h px� 
b
+design %s has port %s driven by constant %s3447*oasys2
Top2
BTN_X2
0Z8-3917h px� 
k
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[1]2
TopZ8-7129h px� 
k
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[0]2
TopZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:10 . Memory (MB): peak = 1460.379 ; gain = 549.164
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:10 . Memory (MB): peak = 1460.379 ; gain = 549.164
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
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:10 . Memory (MB): peak = 1460.379 ; gain = 549.164
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
00:00:00.0042

1460.3792
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
179*designutils2o
kD:/University/CS/major-courses/dld/lab/reports/lab12/My74LS161/My74LS161.srcs/constrs_1/new/constraints.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2o
kD:/University/CS/major-courses/dld/lab/reports/lab12/My74LS161/My74LS161.srcs/constrs_1/new/constraints.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2m
kD:/University/CS/major-courses/dld/lab/reports/lab12/My74LS161/My74LS161.srcs/constrs_1/new/constraints.xdc2
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

1561.8792
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

1561.8792
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
Finished Constraint Validation : Time (s): cpu = 00:00:10 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:10 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:10 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:10 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
.	                1 Bit    Registers := 11    
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
b
+design %s has port %s driven by constant %s3447*oasys2
Top2
BTN_X2
0Z8-3917h px� 
n
9Port %s in module %s is either unconnected or has no load4866*oasys2

BTN_Y[1]2
TopZ8-7129h px� 
n
9Port %s in module %s is either unconnected or has no load4866*oasys2

BTN_Y[0]2
TopZ8-7129h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:12 ; elapsed = 00:00:25 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:15 ; elapsed = 00:00:32 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
}Finished Timing Optimization : Time (s): cpu = 00:00:16 ; elapsed = 00:00:33 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
|Finished Technology Mapping : Time (s): cpu = 00:00:16 ; elapsed = 00:00:33 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
vFinished IO Insertion : Time (s): cpu = 00:00:19 ; elapsed = 00:00:39 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:19 ; elapsed = 00:00:39 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:19 ; elapsed = 00:00:39 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:19 ; elapsed = 00:00:39 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:19 ; elapsed = 00:00:39 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:19 ; elapsed = 00:00:39 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
|2     |CARRY4 |    12|
h px� 
2
%s*synth2
|3     |LUT1   |     2|
h px� 
2
%s*synth2
|4     |LUT2   |    12|
h px� 
2
%s*synth2
|5     |LUT4   |    14|
h px� 
2
%s*synth2
|6     |LUT5   |     2|
h px� 
2
%s*synth2
|7     |LUT6   |     3|
h px� 
2
%s*synth2
|8     |FDRE   |    54|
h px� 
2
%s*synth2
|9     |IBUF   |     4|
h px� 
2
%s*synth2
|10    |OBUF   |    21|
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
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:19 ; elapsed = 00:00:39 . Memory (MB): peak = 1561.879 ; gain = 650.664
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
Synthesis Optimization Runtime : Time (s): cpu = 00:00:14 ; elapsed = 00:00:37 . Memory (MB): peak = 1561.879 ; gain = 549.164
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:19 ; elapsed = 00:00:39 . Memory (MB): peak = 1561.879 ; gain = 650.664
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

1561.8792
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
12Z29-17h px� 
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

1561.8792
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

6124afeeZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
602
82
12
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:222

00:00:472

1561.8792

1071.641Z17-268h px� 
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

1561.8792
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2_
]D:/University/CS/major-courses/dld/lab/reports/lab13/MyMarquee/MyMarquee.runs/synth_1/Top.dcpZ17-1381h px� 
z
%s4*runtcl2^
\Executing : report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu May 30 15:29:09 2024Z17-206h px� 


End Record