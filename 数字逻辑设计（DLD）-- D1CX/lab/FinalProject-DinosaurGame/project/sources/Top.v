module Top(
    input clk,          // ʱ������
    input ps2_clk,      // PS2 ʱ������
    input ps2_data,     // PS2 ��������
    input rstn,         // ��λ����
    input [15:0]SW,     // ���أ�ʵ����ֻ�õ�SW[0]������������Ļ����
    output hs,          // ˮƽͬ���ź����
    output vs,          // ��ֱͬ���ź����
    output [3:0] r,     // 4λ���ɫ�ź����
    output [3:0] g,     // 4λ����ɫ�ź����
    output [3:0] b,     // 4λ����ɫ�ź����
    output SEGLED_CLK,  // �ֶ�ʱ���ź����
    output SEGLED_CLR,  // �ֶ������ź����
    output SEGLED_DO,   // �ֶ�����ź����
    output SEGLED_PEN,  // �ֶα�ѡ�ź����
    output LED_CLK,     // ����4�������������߶��������ʾ���
    output LED_CLR,
    output LED_DO,
    output LED_PEN
);

    localparam Ini = 10'b1_111_111_111;  // ����һ�����޴���������ڳ�ʼ������

    // ʼ��
    reg [31:0] clkdiv;
    always @(posedge clk) begin
        clkdiv <= clkdiv + 1'b1;
    end

    reg [31:0] cnt;         // ��ʱ(1s)
    reg [6:0] cnt_time;     // ����ȷ���ٶȵĸı�
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
    
    // ʵ�ʵ���Ϸ����
    reg [8:0] dino_y = 7'd120;        // ����������
    
    reg [9:0] cactus1_1_x;            // �����ƺ�����
    reg [9:0] cactus1_2_x;
    reg [9:0] cactus1_3_x;
    reg [8:0] cactus1_1_y = 9'd320;   // ������������
    reg [8:0] cactus1_2_y = 9'd320;
    reg [8:0] cactus1_3_y = 9'd320;
    
    reg [9:0] ptero_x;                // ����������
    reg [9:0] ptero_height = 9'd160;  // ����������
    
    reg [9:0] ground_height = 9'd120; // ����߶�
    
    // �����м����
    reg start = 0;                    // ��ʼ����
    reg finish = 0;                   // ��������
    
    reg [7:0] width = 6'd60;          // �����Ŀ��
    reg [7:0] height = 6'd60;         // �����ĸ߶�
    reg is_crouch = 0;                // �����Ƿ��¶�
    reg [5:0] leap;                   // ��������߶�
    reg airup = 0, airdown = 0;       // �ж��ڿ���������������
    reg flash = 0;                    // �����л��ƶ�������ͼƬ��ʵ�ֿ����ܶ���Ч��
    
    reg [4:0] width_c = 5'd20;        // �����ƵĿ��
    reg [5:0] height_c = 6'd40;       // �����Ƶĸ߶�
    reg start_c1[2:0];                // �������Ƿ�ʼ�ƶ�
    
    reg ptero_used;                   // �����Ƿ�ʼ�ƶ�
    
    reg [3:0] speed;                  // �ƶ��ٶ�

 // ������ģ��
    wire [15:0] SW_OK;
    AntiJitter #(4) a0[15:0](.clk(clkdiv[15]), .I(SW), .O(SW_OK));
    
    // PS2��������
    wire up, down;   // ֻ�õ����̵� '��' �� '��'
    wire ready;
    ps2 k1 (.clk(clk), .rst(0), .ps2_clk(ps2_clk), .ps2_data(ps2_data), .up(up), .down(down),.ready(ready));

    // �߶�����������������ʾ��߼�¼��ʵʱ�÷�
    reg [15:0] score = 32'b0;   // ʵʱ�÷�
    reg [15:0] record = 32'b0;  // ��߼�¼
    wire [3:0] sout;
    Seg7Device segDevice(.clkIO(clkdiv[3]), .clkScan(clkdiv[15:14]), .clkBlink(clkdiv[25]),
        .data({record, score}), .point(8'h0), .LES(8'h0), .sout(sout));
    assign SEGLED_CLK = sout[3];
    assign SEGLED_DO = sout[2];
    assign SEGLED_PEN = sout[1];
    assign SEGLED_CLR = sout[0];
    
    // VGA���
    reg [11:0] vga_data;
    wire [9:0] col_addr;
    wire [8:0] row_addr;
    vgac v0 (
        .vga_clk(clkdiv[1]), .clrn(SW_OK[0]), .d_in(vga_data), .row_addr(row_addr), 
        .col_addr(col_addr), .r(r), .g(g), .b(b), .hs(hs), .vs(vs)
    );
    // ������ʾ�Ƿ���SW����
    wire [15:0] ledData;
    assign ledData = SW_OK;
    ShiftReg #(.WIDTH(16)) ledDevice (.clk(clkdiv[3]), .pdata(~ledData), .sout({LED_CLK,LED_DO,LED_PEN,LED_CLR}));
    
    reg [18:0] StCoverAdd;         // ��ʼ����
    wire [11:0] StCoverOut;
    reg [18:0] EdCoverAdd;         // ��������
    wire [11:0] EdCoverOut;
    reg [18:0] BgAdd;              // ��Ϸ����ͼƬ
    wire [11:0] BgOut;

    reg [11:0] DinoAdd;            // ���еĿ���
    wire [11:0] DinoOut;
    reg [11:0] DinocAdd;           // �¶׵Ŀ���
    wire [11:0] DinocOut;
    reg [11:0] Dino1Add;           // �ƶ��Ŀ���1
    wire [11:0] Dino1Out;
    reg [11:0] Dino2Add;           // �ƶ��Ŀ���2
    wire [11:0] Dino2Out;
    
    reg [9:0] Cacone1Add;          // ������1
    wire [11:0] Cacone1Out;
    reg [9:0] Cacone2Add;          // ������2
    wire [11:0] Cacone2Out;
    
    reg [10:0] PteroAdd;           // ����
    wire [11:0] PteroOut;
    
// 3�ŷ���
    start_cover s1(.addra(StCoverAdd), .douta(StCoverOut), .clka(clkdiv[1]));
    background b1(.addra(BgAdd), .douta(BgOut), .clka(clkdiv[1]));
    finish_cover f1(.addra(EdCoverAdd), .douta(EdCoverOut), .clka(clkdiv[1]));
    
    // ����
    dinosaur d1(.addra(DinoAdd), .douta(DinoOut), .clka(clkdiv[1]));
    dinosaur_crouch d2(.addra(DinocAdd), .douta(DinocOut), .clka(clkdiv[1]));
    dinosaur1 d3(.addra(Dino1Add), .douta(Dino1Out), .clka(clkdiv[1]));
    dinosaur2 d4(.addra(Dino2Add), .douta(Dino2Out), .clka(clkdiv[1]));
    
    // ������
    cactus1 c11(.addra(Cacone1Add), .douta(Cacone1Out), .clka(clkdiv[1]));
    cactus1 c12(.addra(Cacone2Add), .douta(Cacone2Out), .clka(clkdiv[1]));

    // ����
    pterosaur p1(.addra(PteroAdd), .douta(PteroOut), .clka(clkdiv[1]));
 
    always @(posedge clkdiv[1]) begin
        // ����
        StCoverAdd <= (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)?  col_addr + (479 - row_addr) * 640 : 0;  
        EdCoverAdd <= (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)?  col_addr + (479 - row_addr) * 640 : 0;  
        BgAdd <= (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)?  (col_addr + 620 - cactus1_1_x) % 640 + (479 - row_addr)*640 : 0;
        // ����
        DinoAdd <= (col_addr >= 0 && col_addr <=  59 && 479-row_addr >= dino_y && 479-row_addr <= dino_y + 59)? col_addr + (479 - row_addr - dino_y) * 60 : 0;
        Dino1Add <= (col_addr >= 0 && col_addr <=  59 && 479-row_addr >= dino_y && 479-row_addr <= dino_y + 59)? col_addr + (479 - row_addr - dino_y) * 60 : 0;
        Dino2Add <= (col_addr >= 0 && col_addr <=  59 && 479-row_addr >= dino_y && 479-row_addr <= dino_y + 59)? col_addr + (479 - row_addr - dino_y) * 60 : 0; 
        DinocAdd <= (col_addr >= 0 && col_addr <=  69 && 479-row_addr >= dino_y && 479-row_addr <= dino_y + 29)? col_addr + (479 - row_addr - dino_y) * 70 : 0; 
        // ������
        Cacone1Add <= (col_addr >= cactus1_1_x && col_addr <= cactus1_1_x + 19 && 479-row_addr >= ground_height && 479 - row_addr <= ground_height + 39)? (col_addr - cactus1_1_x) + (479 - row_addr - ground_height) * 20 : 0;
        Cacone2Add <= (col_addr >= cactus1_2_x && col_addr <= cactus1_2_x + 19 && 479-row_addr >= ground_height && 479 - row_addr <= ground_height + 39)? (col_addr - cactus1_2_x) + (479 - row_addr - ground_height) * 20 : 0;     
        // ����
        PteroAdd <= (col_addr >= ptero_x && col_addr <= ptero_x + 64 && 479-row_addr >= ptero_height && 479-row_addr <= ptero_height + 29)? (col_addr - ptero_x) + (479 - row_addr - ptero_height) * 65 : 0;    
    end
    
    always @(posedge(clkdiv[1])) begin

        // ��ʾ��ʼ����
        if (start == 0) begin  
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= StCoverOut;
        end

        // ��ʾ��������
        else if (finish == 1) begin  
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= EdCoverOut;
        end

        // ��ʾ��Ϸ���棨�����������������ϰ��
        else begin
            // ����
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= BgOut;

            // ����
            if (!is_crouch) begin                      // ��δ�¶�
                if (col_addr >= 0 && col_addr <=  59 && 479 - row_addr >= dino_y && 479 - row_addr <= dino_y + 59) begin
                    if(airup == 1 || airdown == 1)     
// ���ڿ��У���ʾ���п���
                        vga_data <= DinoOut;
                    else if(flash)                     
// ������ʾ�ƶ�������2��ͼ������ʾ��
                        vga_data <= Dino1Out;
                    else  vga_data <= Dino2Out;
                 end
            end
            else begin                                 // ��ʾ�¶׿���
                if (col_addr >= 0 && col_addr <= 69 && 479 - row_addr >= dino_y && 479 - row_addr <= dino_y + 29)
                    vga_data <= DinocOut;
            end

            // ������
            if (start_c1[0]) begin
                if (col_addr >= cactus1_1_x && col_addr <= cactus1_1_x + 19 && 479 - row_addr >= ground_height && 479 - row_addr <= ground_height + 39)
                    vga_data <= Cacone1Out;
            end
            if (start_c1[1]) begin
                if (col_addr >= cactus1_2_x && col_addr <= cactus1_2_x + 19 && 479 - row_addr >= ground_height && 479 - row_addr <= ground_height + 39)
                    vga_data <= Cacone2Out;
            end

            // ����
            if (ptero_used) begin
                if (col_addr >= ptero_x && col_addr <= ptero_x + 64 && 479 - row_addr >= ptero_height && 479 - row_addr <= ptero_height + 29)
                    vga_data <= PteroOut;
            end                                                            
        end         
    end
    
    always @(posedge(clkdiv[1])) begin

        // ��ʾ��ʼ����
        if (start == 0) begin  
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= StCoverOut;
        end

        // ��ʾ��������
        else if (finish == 1) begin  
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= EdCoverOut;
        end

        // ��ʾ��Ϸ���棨�����������������ϰ��
        else begin
            // ����
            if (col_addr >= 0 && col_addr <= 639 && row_addr >= 0 && row_addr <= 479)
                vga_data <= BgOut;

            // ����
            if (!is_crouch) begin                      // ��δ�¶�
                if (col_addr >= 0 && col_addr <=  59 && 479 - row_addr >= dino_y && 479 - row_addr <= dino_y + 59) begin
                    if(airup == 1 || airdown == 1)     
// ���ڿ��У���ʾ���п���
                        vga_data <= DinoOut;
                    else if(flash)                     
// ������ʾ�ƶ�������2��ͼ������ʾ��
                        vga_data <= Dino1Out;
                    else  vga_data <= Dino2Out;
                 end
            end
            else begin                                 // ��ʾ�¶׿���
                if (col_addr >= 0 && col_addr <= 69 && 479 - row_addr >= dino_y && 479 - row_addr <= dino_y + 29)
                    vga_data <= DinocOut;
            end

            // ������
            if (start_c1[0]) begin
                if (col_addr >= cactus1_1_x && col_addr <= cactus1_1_x + 19 && 479 - row_addr >= ground_height && 479 - row_addr <= ground_height + 39)
                    vga_data <= Cacone1Out;
            end
            if (start_c1[1]) begin
                if (col_addr >= cactus1_2_x && col_addr <= cactus1_2_x + 19 && 479 - row_addr >= ground_height && 479 - row_addr <= ground_height + 39)
                    vga_data <= Cacone2Out;
            end

            // ����
            if (ptero_used) begin
                if (col_addr >= ptero_x && col_addr <= ptero_x + 64 && 479 - row_addr >= ptero_height && 479 - row_addr <= ptero_height + 29)
                    vga_data <= PteroOut;
            end                                                            
        end         
    end    
    
    always @(posedge clk) begin

        if (finish == 1 && record < score)                        
// ����Ϸ�������ҵ�ǰ����������߼�¼���������߼�¼
            record <= score;
        if (finish == 0 && start == 1 && cnt % 25_000_000 == 0)   
// ÿ��0.5s��1��
            score <= score + 1;

        if (cnt % 10_000_000 == 0)                               
// ÿ��0.2s�л��ƶ�����ͼƬ��ʵ�ֿ����ƶ���Ч��
            flash = ~flash;

        // ������Ծ�߼�
        if (cnt % 500_000 == 0) begin                             
// ����/�½��ٶ�Ϊ0.1s-1����
            if (airup == 1) begin                                 
// ����������������״̬
                if (dino_y == 250) begin                          
// �������ﵽ�����Ծ�߶ȣ���ʼ�½�
                    airup <= 0;                                       
                    airdown <= 1;                
                end
                else 
                    dino_y <= dino_y + 1;                         
// �����������
            end
            if (airdown == 1) begin                               
// �������������½�״̬
                if(dino_y == 120)                                 
// �������ص����棬ֹͣ�½�
                    airdown <= 0;
                else dino_y <= dino_y - 1;                        
// ��������½�
            end
        end

        if (!rstn) begin            
// ���¸�λ�����ص���ʼ���棬��ǰ��������
            start <= 0; 
            score <= 0;  
        end

        // ����PS2��������
        else if (start == 1) begin
                if (up == 1) begin                                    
 // ������ '��' ������������
                        is_crouch <= 0;
                        if (airup == 0 && airdown == 0) 
                            airup <= 1;
                 end

                 if (down == 1 && airup == 0 && airdown == 0) begin    
// ������ '��' �����ҿ������ڿ��У����¶ף����ı���Ӧ����
                       is_crouch <= 1;
                       width <= 8'd70;
                       height <= 5'd30;
                 end

                 if (down == 0) begin                                  
// ��û�а����κμ�����ʾ��������
                    if (is_crouch == 1) begin
                            is_crouch <= 0;
                            width <= 7'd60;
                            height <= 7'd60;
                    end
                end   
            end

        // ������PS2�������������ʼ�����ݣ���������Ϸ
        else if (ready == 1) begin                      
            // ����                
            start <= 1;
            finish <= 0;
            // ����
            dino_y <= 9'd120;
            width <= 7'd60;
            height <= 7'd60;
            leap <= 10'd150;
            is_crouch <= 0;
            // ������
            cactus1_1_x <= 10'd620;
            cactus1_2_x <= Ini;
            width_c <= 5'd20;
            height_c <= 6'd40;
            start_c1[0] <= 1;
            start_c1[1] <= 0;
            // ����
            ptero_x <= Ini;
            ptero_used <= 0;

            speed <= 4'd5; 
        end

        // �������ƻ������ƶ�������ˣ��򷵻������Ҷˣ�ʵ��ѭ��Ч��
        if (cactus1_1_x <= 0) 
            cactus1_1_x <= 10'd620;
        if (cactus1_2_x <= 0) 
            cactus1_2_x <= 10'd620;         
        if (ptero_x <= 0)
            ptero_x <= 10'd620;

        // ��ײ�жϣ���ײ���ϰ����Ϸ����
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

        // ���������ƺͿ�����λ��
        if(start_c1[0] && !ptero_used && cactus1_1_x <= 9'd440) begin
            ptero_used = 1;
            ptero_x = 10'd620;
        end

        if (start_c1[0] && !start_c1[1] && cactus1_1_x <= 9'd240) begin
            start_c1[1] <= 1;
            cactus1_2_x <= 10'd620;
        end
        
        // ÿ��4s�ƶ��ٶȱ�죬�Ӷ���������Ϸ�Ѷ�
        if (start == 1 && cnt_time == 3 && speed < 5) begin
            speed <= speed + 1;
        end

        // ÿ��0.1s�ƶ������ƺ�������ʹ��Ϸ��������������"˿��"
        if(start == 1 && cnt % 5_000_000==0) begin
            if (start_c1[0])
                cactus1_1_x <= cactus1_1_x - speed;
            if (start_c1[1])
                cactus1_2_x <= cactus1_2_x - speed;
            if (ptero_used)
                ptero_x <= ptero_x-speed;
        end
           
        // ʮ���Ƽ���
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