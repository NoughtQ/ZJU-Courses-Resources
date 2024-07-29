/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : DisplaySync                                                  **
 **                                                                          **
 *****************************************************************************/

module DisplaySync( AN,
                    HEX,
                    LE,
                    LEs,
                    hexs,
                    point,
                    points,
                    scan );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [3:0]  LEs;
   input [15:0] hexs;
   input [3:0]  points;
   input [1:0]  scan;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [3:0] AN;
   output [3:0] HEX;
   output       LE;
   output       point;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0]  s_logisimBus1;
   wire [1:0]  s_logisimBus10;
   wire [15:0] s_logisimBus15;
   wire [3:0]  s_logisimBus17;
   wire [3:0]  s_logisimBus18;
   wire [3:0]  s_logisimBus19;
   wire [3:0]  s_logisimBus20;
   wire [3:0]  s_logisimBus21;
   wire [3:0]  s_logisimBus22;
   wire [3:0]  s_logisimBus23;
   wire        s_logisimNet0;
   wire        s_logisimNet16;
   wire        s_logisimNet2;
   wire        s_logisimNet3;
   wire        s_logisimNet4;
   wire        s_logisimNet5;
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus10[1:0]  = scan;
   assign s_logisimBus15[15:0] = hexs;
   assign s_logisimBus18[3:0]  = points;
   assign s_logisimBus19[3:0]  = LEs;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign AN    = s_logisimBus1[3:0];
   assign HEX   = s_logisimBus17[3:0];
   assign LE    = s_logisimNet0;
   assign point = s_logisimNet16;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Constant
   assign  s_logisimBus20[3:0]  =  4'hE;


   // Constant
   assign  s_logisimBus21[3:0]  =  4'hD;


   // Constant
   assign  s_logisimBus22[3:0]  =  4'hB;


   // Constant
   assign  s_logisimBus23[3:0]  =  4'h7;


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   Mux4to1   mux_points (.D0(s_logisimBus18[0]),
                         .D1(s_logisimBus18[1]),
                         .D2(s_logisimBus18[2]),
                         .D3(s_logisimBus18[3]),
                         .S(s_logisimBus10[1:0]),
                         .Y(s_logisimNet16));

   Mux4to1   mux_LE (.D0(s_logisimBus19[0]),
                     .D1(s_logisimBus19[1]),
                     .D2(s_logisimBus19[2]),
                     .D3(s_logisimBus19[3]),
                     .S(s_logisimBus10[1:0]),
                     .Y(s_logisimNet0));

   Mux4to1b4   mux_AN (.I0(s_logisimBus20[3:0]),
                       .I1(s_logisimBus21[3:0]),
                       .I2(s_logisimBus22[3:0]),
                       .I3(s_logisimBus23[3:0]),
                       .O(s_logisimBus1[3:0]),
                       .S(s_logisimBus10[1:0]));

   Mux4to1b4   mux_hexs (.I0(s_logisimBus15[3:0]),
                         .I1(s_logisimBus15[7:4]),
                         .I2(s_logisimBus15[11:8]),
                         .I3(s_logisimBus15[15:12]),
                         .O(s_logisimBus17[3:0]),
                         .S(s_logisimBus10[1:0]));

endmodule
