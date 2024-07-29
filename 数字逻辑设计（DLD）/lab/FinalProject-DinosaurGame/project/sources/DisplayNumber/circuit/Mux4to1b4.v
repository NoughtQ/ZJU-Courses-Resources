/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : Mux4to1b4                                                    **
 **                                                                          **
 *****************************************************************************/

module Mux4to1b4( I0,
                  I1,
                  I2,
                  I3,
                  O,
                  S );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [3:0] I0;
   input [3:0] I1;
   input [3:0] I2;
   input [3:0] I3;
   input [1:0] S;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [3:0] O;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0] s_logisimBus10;
   wire [3:0] s_logisimBus23;
   wire [3:0] s_logisimBus24;
   wire [1:0] s_logisimBus3;
   wire [3:0] s_logisimBus8;
   wire [3:0] s_logisimBus9;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet25;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet7;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus10[3:0] = I3;
   assign s_logisimBus23[3:0] = I2;
   assign s_logisimBus3[1:0]  = S;
   assign s_logisimBus8[3:0]  = I0;
   assign s_logisimBus9[3:0]  = I1;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign O = s_logisimBus24[3:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   Mux4to1   O1 (.D0(s_logisimBus8[1]),
                 .D1(s_logisimBus9[1]),
                 .D2(s_logisimBus23[1]),
                 .D3(s_logisimBus10[1]),
                 .S(s_logisimBus3[1:0]),
                 .Y(s_logisimBus24[1]));

   Mux4to1   O2 (.D0(s_logisimBus8[2]),
                 .D1(s_logisimBus9[2]),
                 .D2(s_logisimBus23[2]),
                 .D3(s_logisimBus10[2]),
                 .S(s_logisimBus3[1:0]),
                 .Y(s_logisimBus24[2]));

   Mux4to1   O3 (.D0(s_logisimBus8[3]),
                 .D1(s_logisimBus9[3]),
                 .D2(s_logisimBus23[3]),
                 .D3(s_logisimBus10[3]),
                 .S(s_logisimBus3[1:0]),
                 .Y(s_logisimBus24[3]));

   Mux4to1   O0 (.D0(s_logisimBus8[0]),
                 .D1(s_logisimBus9[0]),
                 .D2(s_logisimBus23[0]),
                 .D3(s_logisimBus10[0]),
                 .S(s_logisimBus3[1:0]),
                 .Y(s_logisimBus24[0]));

endmodule
