/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : DisplayNumber                                                **
 **                                                                          **
 *****************************************************************************/

module DisplayNumber( AN,
                      LEs,
                      SEGMENT,
                      clk,
                      hexs,
                      points,
                      rst );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [3:0]  LEs;
   input        clk;
   input [15:0] hexs;
   input [3:0]  points;
   input        rst;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [3:0] AN;
   output [7:0] SEGMENT;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [7:0]  s_logisimBus11;
   wire [15:0] s_logisimBus12;
   wire [3:0]  s_logisimBus13;
   wire [3:0]  s_logisimBus14;
   wire [3:0]  s_logisimBus19;
   wire [3:0]  s_logisimBus20;
   wire [31:0] s_logisimBus23;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet2;
   wire        s_logisimNet21;
   wire        s_logisimNet22;
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
   assign s_logisimBus12[15:0] = hexs;
   assign s_logisimBus19[3:0]  = points;
   assign s_logisimBus20[3:0]  = LEs;
   assign s_logisimNet21       = clk;
   assign s_logisimNet22       = rst;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign AN      = s_logisimBus13[3:0];
   assign SEGMENT = s_logisimBus11[7:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   clkdiv   m0 (.clk(s_logisimNet21),
                .div_res(s_logisimBus23[31:0]),
                .rst(s_logisimNet22));

   DisplaySync   m1 (.AN(s_logisimBus13[3:0]),
                     .HEX(s_logisimBus14[3:0]),
                     .LE(s_logisimNet1),
                     .LEs(s_logisimBus20[3:0]),
                     .hexs(s_logisimBus12[15:0]),
                     .point(s_logisimNet10),
                     .points(s_logisimBus19[3:0]),
                     .scan(s_logisimBus23[18:17]));

   MyMC14495   m2 (.D0(s_logisimBus14[0]),
                   .D1(s_logisimBus14[1]),
                   .D2(s_logisimBus14[2]),
                   .D3(s_logisimBus14[3]),
                   .LE(s_logisimNet1),
                   .Point(s_logisimNet10),
                   .a(s_logisimBus11[0]),
                   .b(s_logisimBus11[1]),
                   .c(s_logisimBus11[2]),
                   .d(s_logisimBus11[3]),
                   .e(s_logisimBus11[4]),
                   .f(s_logisimBus11[5]),
                   .g(s_logisimBus11[6]),
                   .p(s_logisimBus11[7]));

endmodule
