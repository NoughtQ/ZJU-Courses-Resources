module Top(
    input clk,          // 时钟输入
    input ps2_clk,      // PS2 时钟输入
    input ps2_data,     // PS2 数据输入
    input rstn,         // 复位输入
    input [15:0]SW,     // 开关，实际上只用到SW[0]，用来控制屏幕亮灭
    output hs,          // 水平同步信号输出
    output vs,          // 垂直同步信号输出
    output [3:0] r,     // 4位宽红色信号输出
    output [3:0] g,     // 4位宽绿色信号输出
    output [3:0] b,     // 4位宽蓝色信号输出
    output SEGLED_CLK,  // 分段时钟信号输出
    output SEGLED_CLR,  // 分段清零信号输出
    output SEGLED_DO,   // 分段输出信号输出
    output SEGLED_PEN,  // 分段笔选信号输出
    output LED_CLK,     // 下面4个参数均用于七段数码管显示输出
    output LED_CLR,
    output LED_DO,
    output LED_PEN
);

    localparam Ini = 10'b1_111_111_111;  // 定义一个无限大的数，用于初始化坐标

    // 始终
    reg [31:0] clkdiv;
    always @(posedge clk) begin
        clkdiv <= clkdiv + 1'b1;
    end

    reg [31:0] cnt;         // 计时(1s)
    reg [6:0] cnt_time;     // 用来确定速度的改变
    always @(posedge clk) begin
        if (cnt < 50_000_000)  // 1s
            cnt <= cnt + 1;
        else begin
            cnt <= 0;
            cnt_time <= cnt_time+1;
            if(cnt_time == 4)   // 4s
                cnt_time<=0;
         end
    end
    
    // 实际的游戏坐标
    reg [8:0] dino_y = 7'd120;        // 恐龙纵坐标
    
    reg [9:0] cactus1_1_x;            // 仙人掌横坐标
    reg [9:0] cactus1_2_x;
    reg [9:0] cactus1_3_x;
    reg [8:0] cactus1_1_y = 9'd320;   // 仙人掌纵坐标
    reg [8:0] cactus1_2_y = 9'd320;
    reg [8:0] cactus1_3_y = 9'd320;
    
    reg [9:0] ptero_x;                // 翼龙横坐标
    reg [9:0] ptero_height = 9'd160;  // 翼龙纵坐标
    
    reg [9:0] ground_height = 9'd120; // 地面高度
    
    // 其他中间变量
    reg start = 0;                    // 开始界面
    reg finish = 0;                   // 结束界面
    
    reg [7:0] width = 6'd60;          // 恐龙的宽度
    reg [7:0] height = 6'd60;         // 恐龙的高度
    reg is_crouch = 0;                // 恐龙是否下蹲
    reg [5:0] leap;                   // 恐龙跳起高度
    reg airup = 0, airdown = 0;       // 判断在空中上升还是下落
    reg flash = 0;                    // 用于切换移动恐龙的图片，实现恐龙跑动的效果
    
    reg [4:0] width_c = 5'd20;        // 仙人掌的宽度
    reg [5:0] height_c = 6'd40;       // 仙人掌的高度
    reg start_c1[2:0];                // 仙人掌是否开始移动
    
    reg ptero_used;                   // 翼龙是否开始移动
    
    reg [3:0] speed;                  // 移动速度

 // 防抖动模块
    wire [15:0] SW_OK;
    AntiJitter #(4) a0[15:0](.clk(clkdiv[15]), .I(SW), .O(SW_OK));
    
    // PS2键盘输入
    wire up, down;   // 只用到键盘的 '↑' 和 '↓'
    wire ready;
    ps2 k1 (.clk(clk), .rst(0), .ps2_clk(ps2_clk), .ps2_data(ps2_data), .up(up), .down(down),.ready(ready));

    // 七段数码管输出，用于显示最高记录和实时得分
    reg [15:0] score = 32'b0;   // 实时得分
    reg [15:0] record = 32'b0;  // 最高记录
    wire [3:0] sout;
    Seg7Device segDevice(.clkIO(clkdiv[3]), .clkScan(clkdiv[15:14]), .clkBlink(clkdiv[25]),
        .data({record, score}), .point(8'h0), .LES(8'h0), .sout(sout));
    assign SEGLED_CLK = sout[3];
    assign SEGLED_DO = sout[2];
    assign SEGLED_PEN = sout[1];
    assign SEGLED_CLR = sout[0];
    
    // VGA输出
    reg [11:0] vga_data;
    wire [9:0] col_addr;
    wire [8:0] row_addr;
    vgac v0 (
        .vga_clk(clkdiv[1]), .clrn(SW_OK[0]), .d_in(vga_data), .row_addr(row_addr), 
        .col_addr(col_addr), .r(r), .g(g), .b(b), .hs(hs), .vs(vs)
    );
    // 用于显示是否开启SW开关
    wire [15:0] ledData;
    assign ledData = SW_OK;
    ShiftReg #(.WIDTH(16)) ledDevice (.clk(clkdiv[3]), .pdata(~ledData), .sout({LED_CLK,LED_DO,LED_PEN,LED_CLR}));
    
    reg [18:0] StCoverAdd;         // 开始封面
    wire [11:0] StCoverOut;
    reg [18:0] EdCoverAdd;         // 结束封面
    wire [11:0] EdCoverOut;
    reg [18:0] BgAdd;              // 游戏背景图片
    wire [11:0] BgOut;

    reg [11:0] DinoAdd;            // 空中的恐龙
    wire [11:0] DinoOut;
    reg [11:0] DinocAdd;           // 下蹲的恐龙
    wire [11:0] DinocOut;
    reg [11:0] Dino1Add;           // 移动的恐龙1
    wire [11:0] Dino1Out;
    reg [11:0] Dino2Add;           // 移动的恐龙2
    wire [11:0] Dino2Out;
    
    reg [9:0] Cacone1Add;          // 仙人掌1
    wire [11:0] Cacone1Out;
    reg [9:0] Cacone2Add;          // 仙人掌2
    wire [11:0] Cacone2Out;
    
    reg [10:0] PteroAdd;           // 翼龙
    wire [11:0] PteroOut;
    
// 3张封面
    start_cover s1(.addra(StCoverAdd), .douta(StCoverOut), .clka(clkdiv[1]));
    background b1(.addra(BgAdd), .douta(BgOut), .clka(clkdiv[1]));
    finish_cover f1(.addra(EdCoverAdd), .douta(EdCoverOut), .clka(clkdiv[1]));
    
    // 恐龙
    dinosaur d1(.addra(DinoAdd), .douta(DinoOut), .clka(clkdiv[1]));
    dinosaur_crouch d2(.addra(DinocAdd), .douta(DinocOut), .clka(clkdiv[1]));
    dinosaur1 d3(.addra(Dino1Add), .douta(Dino1Out), .clka(clkdiv[1]));
    dinosaur2 d4(.addra(Dino2Add), .douta(Dino2Out), .clka(clkdiv[1]));
    
    // 仙人掌
    cactus1 c11(.addra(Cacone1Add), .douta(Cacone1Out), .clka(clkdiv[1]));
    cactus1 c12(.addra(Cacone2Add), .douta(Cacone2Out), .clka(clkdiv[1]));

    // 翼龙
    pterosaur p1(.addra(PteroAdd), .douta(PteroOut), .clka(clkdiv[1]));
 
    always @(posedge clkdiv[1]) begin
        // 封面
        StCoverAdd <= (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)?  col_addr + (479 - row_addr) * 640 : 0;  
        EdCoverAdd <= (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)?  col_addr + (479 - row_addr) * 640 : 0;  
        BgAdd <= (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)?  (col_addr + 620 - cactus1_1_x) % 640 + (479 - row_addr)*640 : 0;
        // 恐龙
        DinoAdd <= (col_addr >= 0 && col_addr <=  59 && 479-row_addr >= dino_y && 479-row_addr <= dino_y + 59)? col_addr + (479 - row_addr - dino_y) * 60 : 0;
        Dino1Add <= (col_addr >= 0 && col_addr <=  59 && 479-row_addr >= dino_y && 479-row_addr <= dino_y + 59)? col_addr + (479 - row_addr - dino_y) * 60 : 0;
        Dino2Add <= (col_addr >= 0 && col_addr <=  59 && 479-row_addr >= dino_y && 479-row_addr <= dino_y + 59)? col_addr + (479 - row_addr - dino_y) * 60 : 0; 
        DinocAdd <= (col_addr >= 0 && col_addr <=  69 && 479-row_addr >= dino_y && 479-row_addr <= dino_y + 29)? col_addr + (479 - row_addr - dino_y) * 70 : 0; 
        // 仙人掌
        Cacone1Add <= (col_addr >= cactus1_1_x && col_addr <= cactus1_1_x + 19 && 479-row_addr >= ground_height && 479 - row_addr <= ground_height + 39)? (col_addr - cactus1_1_x) + (479 - row_addr - ground_height) * 20 : 0;
        Cacone2Add <= (col_addr >= cactus1_2_x && col_addr <= cactus1_2_x + 19 && 479-row_addr >= ground_height && 479 - row_addr <= ground_height + 39)? (col_addr - cactus1_2_x) + (479 - row_addr - ground_height) * 20 : 0;     
        // 翼龙
        PteroAdd <= (col_addr >= ptero_x && col_addr <= ptero_x + 64 && 479-row_addr >= ptero_height && 479-row_addr <= ptero_height + 29)? (col_addr - ptero_x) + (479 - row_addr - ptero_height) * 65 : 0;    
    end
    
    always @(posedge(clkdiv[1])) begin

        // 显示开始封面
        if (start == 0) begin  
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= StCoverOut;
        end

        // 显示结束封面
        else if (finish == 1) begin  
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= EdCoverOut;
        end

        // 显示游戏界面（包括背景、恐龙和障碍物）
        else begin
            // 背景
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= BgOut;

            // 恐龙
            if (!is_crouch) begin                      // 若未下蹲
                if (col_addr >= 0 && col_addr <=  59 && 479 - row_addr >= dino_y && 479 - row_addr <= dino_y + 59) begin
                    if(airup == 1 || airdown == 1)     
// 若在空中，显示空中恐龙
                        vga_data <= DinoOut;
                    else if(flash)                     
// 否则显示移动恐龙（2张图交错显示）
                        vga_data <= Dino1Out;
                    else  vga_data <= Dino2Out;
                 end
            end
            else begin                                 // 显示下蹲恐龙
                if (col_addr >= 0 && col_addr <= 69 && 479 - row_addr >= dino_y && 479 - row_addr <= dino_y + 29)
                    vga_data <= DinocOut;
            end

            // 仙人掌
            if (start_c1[0]) begin
                if (col_addr >= cactus1_1_x && col_addr <= cactus1_1_x + 19 && 479 - row_addr >= ground_height && 479 - row_addr <= ground_height + 39)
                    vga_data <= Cacone1Out;
            end
            if (start_c1[1]) begin
                if (col_addr >= cactus1_2_x && col_addr <= cactus1_2_x + 19 && 479 - row_addr >= ground_height && 479 - row_addr <= ground_height + 39)
                    vga_data <= Cacone2Out;
            end

            // 翼龙
            if (ptero_used) begin
                if (col_addr >= ptero_x && col_addr <= ptero_x + 64 && 479 - row_addr >= ptero_height && 479 - row_addr <= ptero_height + 29)
                    vga_data <= PteroOut;
            end                                                            
        end         
    end
    
    always @(posedge(clkdiv[1])) begin

        // 显示开始封面
        if (start == 0) begin  
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= StCoverOut;
        end

        // 显示结束封面
        else if (finish == 1) begin  
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= EdCoverOut;
        end

        // 显示游戏界面（包括背景、恐龙和障碍物）
        else begin
            // 背景
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= BgOut;

            // 恐龙
            if (!is_crouch) begin                      // 若未下蹲
                if (col_addr >= 0 && col_addr <=  59 && 479 - row_addr >= dino_y && 479 - row_addr <= dino_y + 59) begin
                    if(airup == 1 || airdown == 1)     
// 若在空中，显示空中恐龙
                        vga_data <= DinoOut;
                    else if(flash)                     
// 否则显示移动恐龙（2张图交错显示）
                        vga_data <= Dino1Out;
                    else  vga_data <= Dino2Out;
                 end
            end
            else begin                                 // 显示下蹲恐龙
                if (col_addr >= 0 && col_addr <= 69 && 479 - row_addr >= dino_y && 479 - row_addr <= dino_y + 29)
                    vga_data <= DinocOut;
            end

            // 仙人掌
            if (start_c1[0]) begin
                if (col_addr >= cactus1_1_x && col_addr <= cactus1_1_x + 19 && 479 - row_addr >= ground_height && 479 - row_addr <= ground_height + 39)
                    vga_data <= Cacone1Out;
            end
            if (start_c1[1]) begin
                if (col_addr >= cactus1_2_x && col_addr <= cactus1_2_x + 19 && 479 - row_addr >= ground_height && 479 - row_addr <= ground_height + 39)
                    vga_data <= Cacone2Out;
            end

            // 翼龙
            if (ptero_used) begin
                if (col_addr >= ptero_x && col_addr <= ptero_x + 64 && 479 - row_addr >= ptero_height && 479 - row_addr <= ptero_height + 29)
                    vga_data <= PteroOut;
            end                                                            
        end         
    end    
    
    always @(posedge clk) begin

        if (finish == 1 && record < score)                        
// 若游戏结束，且当前分数高于最高记录，则更新最高记录
            record <= score;
        if (finish == 0 && start == 1 && cnt % 25_000_000 == 0)   
// 每过0.5s记1分
            score <= score + 1;

        if (cnt % 10_000_000 == 0)                               
// 每隔0.2s切换移动恐龙图片，实现恐龙移动的效果
            flash = ~flash;

        // 处理跳跃逻辑
        if (cnt % 500_000 == 0) begin                             
// 上跳/下降速度为0.1s-1像素
            if (airup == 1) begin                                 
// 若恐龙正处于上跳状态
                if (dino_y == 250) begin                          
// 若恐龙达到最大跳跃高度，开始下降
                    airup <= 0;                                       
                    airdown <= 1;                
                end
                else 
                    dino_y <= dino_y + 1;                         
// 否则继续上跳
            end
            if (airdown == 1) begin                               
// 若恐龙正处于下降状态
                if(dino_y == 120)                                 
// 若恐龙回到地面，停止下降
                    airdown <= 0;
                else dino_y <= dino_y - 1;                        
// 否则继续下降
            end
        end

        if (!rstn) begin            
// 按下复位键，回到开始界面，当前分数清零
            start <= 0; 
            score <= 0;  
        end

        // 处理PS2键盘输入
        else if (start == 1) begin
                if (up == 1) begin                                    
 // 若按下 '↑' 键，恐龙跳起
                        is_crouch <= 0;
                        if (airup == 0 && airdown == 0) 
                            airup <= 1;
                 end

                 if (down == 1 && airup == 0 && airdown == 0) begin    
// 若按下 '↓' 键，且恐龙不在空中，则下蹲，并改变相应坐标
                       is_crouch <= 1;
                       width <= 8'd70;
                       height <= 5'd30;
                 end

                 if (down == 0) begin                                  
// 若没有按下任何键，显示正常恐龙
                    if (is_crouch == 1) begin
                            is_crouch <= 0;
                            width <= 7'd60;
                            height <= 7'd60;
                    end
                end   
            end

        // 若按下PS2键盘任意键，初始化数据，并进入游戏
        else if (ready == 1) begin                      
            // 封面                
            start <= 1;
            finish <= 0;
            // 恐龙
            dino_y <= 9'd120;
            width <= 7'd60;
            height <= 7'd60;
            leap <= 10'd150;
            is_crouch <= 0;
            // 仙人掌
            cactus1_1_x <= 10'd620;
            cactus1_2_x <= Ini;
            width_c <= 5'd20;
            height_c <= 6'd40;
            start_c1[0] <= 1;
            start_c1[1] <= 0;
            // 翼龙
            ptero_x <= Ini;
            ptero_used <= 0;

            speed <= 4'd5; 
        end

        // 若仙人掌或翼龙移动到最左端，则返回至最右端，实现循环效果
        if (cactus1_1_x <= 0) 
            cactus1_1_x <= 10'd620;
        if (cactus1_2_x <= 0) 
            cactus1_2_x <= 10'd620;         
        if (ptero_x <= 0)
            ptero_x <= 10'd620;

        // 碰撞判断：若撞到障碍物，游戏结束
        if ( width >= cactus1_1_x) begin
            if (ground_height + 39 >= dino_y )
                finish <= 1;
        end
        if (width >= cactus1_2_x) begin
            if (ground_height + 39 >= dino_y )
                finish <= 1;
        end
        if (width >= ptero_x) begin
            if (is_crouch == 0 && dino_y <= ptero_height + 29)
                finish <= 1;                              
        end

        // 处理仙人掌和恐龙的位置
        if(start_c1[0] && !ptero_used && cactus1_1_x <= 9'd440) begin
            ptero_used = 1;
            ptero_x = 10'd620;
        end

        if (start_c1[0] && !start_c1[1] && cactus1_1_x <= 9'd240) begin
            start_c1[1] <= 1;
            cactus1_2_x <= 10'd620;
        end
        
        // 每隔4s移动速度变快，从而逐渐提升游戏难度
        if (start == 1 && cnt_time == 3 && speed < 5) begin
            speed <= speed + 1;
        end

        // 每隔0.1s移动仙人掌和翼龙，使游戏动画看起来更加"丝滑"
        if(start == 1 && cnt % 5_000_000==0) begin
            if (start_c1[0])
                cactus1_1_x <= cactus1_1_x - speed;
            if (start_c1[1])
                cactus1_2_x <= cactus1_2_x - speed;
            if (ptero_used)
                ptero_x <= ptero_x-speed;
        end
           
        // 十进制计数
        if (score[3:0] == 4'ha) begin
            score[7:4] <= score[7:4] + 1;
            score[3:0] <= 4'h0;
        end
        if (score[7:4] == 4'ha) begin
            score[11:8] <= score[11:8] + 1;
            score[7:4] <= 4'h0;
        end
        if (score[11:8] == 4'ha) begin
            score[15:12] <= score[15:12] + 1;
            score[11:8] <= 4'h0;
        end                
    end       

endmodule