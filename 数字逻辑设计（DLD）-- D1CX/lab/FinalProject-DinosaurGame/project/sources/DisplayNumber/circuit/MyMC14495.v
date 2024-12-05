/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : MyMC14495                                                    **
 **                                                                          **
 *****************************************************************************/

module MyMC14495( D0,
                  D1,
                  D2,
                  D3,
                  LE,
                  Point,
                  a,
                  b,
                  c,
                  d,
                  e,
                  f,
                  g,
                  p );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input D0;
   input D1;
   input D2;
   input D3;
   input LE;
   input Point;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output a;
   output b;
   output c;
   output d;
   output e;
   output f;
   output g;
   output p;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet11;
   wire s_logisimNet12;
   wire s_logisimNet13;
   wire s_logisimNet14;
   wire s_logisimNet15;
   wire s_logisimNet16;
   wire s_logisimNet17;
   wire s_logisimNet18;
   wire s_logisimNet19;
   wire s_logisimNet2;
   wire s_logisimNet20;
   wire s_logisimNet21;
   wire s_logisimNet22;
   wire s_logisimNet23;
   wire s_logisimNet24;
   wire s_logisimNet25;
   wire s_logisimNet26;
   wire s_logisimNet27;
   wire s_logisimNet28;
   wire s_logisimNet29;
   wire s_logisimNet3;
   wire s_logisimNet30;
   wire s_logisimNet31;
   wire s_logisimNet32;
   wire s_logisimNet33;
   wire s_logisimNet34;
   wire s_logisimNet35;
   wire s_logisimNet36;
   wire s_logisimNet37;
   wire s_logisimNet38;
   wire s_logisimNet39;
   wire s_logisimNet4;
   wire s_logisimNet40;
   wire s_logisimNet41;
   wire s_logisimNet42;
   wire s_logisimNet43;
   wire s_logisimNet44;
   wire s_logisimNet45;
   wire s_logisimNet5;
   wire s_logisimNet6;
   wire s_logisimNet7;
   wire s_logisimNet8;
   wire s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet1  = D2;
   assign s_logisimNet11 = LE;
   assign s_logisimNet14 = D0;
   assign s_logisimNet2  = D1;
   assign s_logisimNet21 = Point;
   assign s_logisimNet5  = D3;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign a = s_logisimNet37;
   assign b = s_logisimNet45;
   assign c = s_logisimNet39;
   assign d = s_logisimNet38;
   assign e = s_logisimNet44;
   assign f = s_logisimNet32;
   assign g = s_logisimNet23;
   assign p = s_logisimNet6;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimNet21;

   // NOT Gate
   assign s_logisimNet12 = ~s_logisimNet5;

   // NOT Gate
   assign s_logisimNet4 = ~s_logisimNet2;

   // NOT Gate
   assign s_logisimNet15 = ~s_logisimNet1;

   // NOT Gate
   assign s_logisimNet7 = ~s_logisimNet14;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_1 (.input1(s_logisimNet2),
               .input2(s_logisimNet15),
               .input3(s_logisimNet12),
               .result(s_logisimNet18));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_2 (.input1(s_logisimNet7),
               .input2(s_logisimNet1),
               .input3(s_logisimNet5),
               .result(s_logisimNet31));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_3 (.input1(s_logisimNet33),
               .input2(s_logisimNet24),
               .input3(s_logisimNet22),
               .result(s_logisimNet27));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_4 (.input1(s_logisimNet14),
               .input2(s_logisimNet4),
               .input3(s_logisimNet1),
               .input4(s_logisimNet12),
               .result(s_logisimNet25));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet11),
               .input2(s_logisimNet27),
               .result(s_logisimNet23));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_6 (.input1(s_logisimNet14),
               .input2(s_logisimNet4),
               .input3(s_logisimNet15),
               .result(s_logisimNet8));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_7 (.input1(s_logisimNet30),
               .input2(s_logisimNet20),
               .input3(s_logisimNet13),
               .input4(s_logisimNet29),
               .result(s_logisimNet40));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet11),
               .input2(s_logisimNet9),
               .result(s_logisimNet45));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet11),
               .input2(s_logisimNet3),
               .result(s_logisimNet44));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_10 (.input1(s_logisimNet34),
                .input2(s_logisimNet18),
                .input3(s_logisimNet16),
                .input4(s_logisimNet26),
                .result(s_logisimNet35));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_11 (.input1(s_logisimNet14),
                .input2(s_logisimNet2),
                .input3(s_logisimNet12),
                .result(s_logisimNet34));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimNet11),
                .input2(s_logisimNet35),
                .result(s_logisimNet32));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_13 (.input1(s_logisimNet4),
                .input2(s_logisimNet15),
                .input3(s_logisimNet12),
                .result(s_logisimNet22));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_14 (.input1(s_logisimNet14),
                .input2(s_logisimNet2),
                .input3(s_logisimNet1),
                .result(s_logisimNet20));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_15 (.input1(s_logisimNet14),
                .input2(s_logisimNet4),
                .input3(s_logisimNet1),
                .input4(s_logisimNet5),
                .result(s_logisimNet26));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimNet11),
                .input2(s_logisimNet28),
                .result(s_logisimNet37));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_17 (.input1(s_logisimNet8),
                .input2(s_logisimNet36),
                .input3(s_logisimNet17),
                .result(s_logisimNet3));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_18 (.input1(s_logisimNet2),
                .input2(s_logisimNet1),
                .input3(s_logisimNet5),
                .result(s_logisimNet10));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_19 (.input1(s_logisimNet14),
                .input2(s_logisimNet2),
                .input3(s_logisimNet1),
                .input4(s_logisimNet12),
                .result(s_logisimNet24));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_20 (.input1(s_logisimNet14),
                .input2(s_logisimNet2),
                .input3(s_logisimNet5),
                .result(s_logisimNet43));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_21 (.input1(s_logisimNet14),
                .input2(s_logisimNet15),
                .input3(s_logisimNet12),
                .result(s_logisimNet16));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_22 (.input1(s_logisimNet10),
                .input2(s_logisimNet41),
                .input3(s_logisimNet31),
                .result(s_logisimNet42));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_23 (.input1(s_logisimNet14),
                .input2(s_logisimNet15),
                .input3(s_logisimNet4),
                .input4(s_logisimNet12),
                .result(s_logisimNet29));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_24 (.input1(s_logisimNet14),
                .input2(s_logisimNet2),
                .input3(s_logisimNet15),
                .input4(s_logisimNet5),
                .result(s_logisimNet0));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_25 (.input1(s_logisimNet7),
                .input2(s_logisimNet2),
                .input3(s_logisimNet15),
                .input4(s_logisimNet5),
                .result(s_logisimNet30));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_26 (.input1(s_logisimNet4),
                .input2(s_logisimNet1),
                .input3(s_logisimNet12),
                .result(s_logisimNet36));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_27 (.input1(s_logisimNet7),
                .input2(s_logisimNet4),
                .input3(s_logisimNet1),
                .input4(s_logisimNet12),
                .result(s_logisimNet13));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_28 (.input1(s_logisimNet14),
                .input2(s_logisimNet12),
                .result(s_logisimNet17));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_29 (.input1(s_logisimNet7),
                .input2(s_logisimNet4),
                .input3(s_logisimNet1),
                .input4(s_logisimNet5),
                .result(s_logisimNet33));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_30 (.input1(s_logisimNet7),
                .input2(s_logisimNet2),
                .input3(s_logisimNet1),
                .result(s_logisimNet19));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_31 (.input1(s_logisimNet11),
                .input2(s_logisimNet42),
                .result(s_logisimNet39));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_32 (.input1(s_logisimNet43),
                .input2(s_logisimNet31),
                .input3(s_logisimNet19),
                .input4(s_logisimNet25),
                .result(s_logisimNet9));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_33 (.input1(s_logisimNet11),
                .input2(s_logisimNet40),
                .result(s_logisimNet38));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_34 (.input1(s_logisimNet7),
                .input2(s_logisimNet2),
                .input3(s_logisimNet15),
                .input4(s_logisimNet12),
                .result(s_logisimNet41));

   OR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_35 (.input1(s_logisimNet0),
                .input2(s_logisimNet26),
                .input3(s_logisimNet13),
                .input4(s_logisimNet29),
                .result(s_logisimNet28));


endmodule
