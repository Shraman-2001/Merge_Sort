`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2025 18:48:43
// Design Name: 
// Module Name: merge_sort
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module top(
input[5:0]x1,x2,x3,x4,x5,x6,x7,x8,
input clk,rst,
output [5:0] y1,y2,y3,y4,y5,y6,y7,y8
);
reg [47:0] x;
reg [2:0]write_addr;
reg [5:0] write_data, read_addr;
reg [4:0] ct;
reg write_en,read_en;
wire [5:0]read_data,m1,m2,m3,m4,m5,m6,m7,m8;
always@(posedge clk or negedge rst)
begin
    if(rst)
    begin
        write_addr<=3'd0;
        write_data<=6'd0;
        write_en<=0;
        read_addr<=0;
        ct<=0;
        x<={x1,x2,x3,x4,x5,x6,x7,x8};
    end
    else
    begin
        write_addr<=x[47:41];
        x<=x>>6;
        if(write_addr==3'd7)
        begin
            write_addr<=3'd7;
            write_en<=0;
        end
        else
        begin
            write_addr<=write_addr+3'd1;
            write_en<=1;
        end
        if(ct>5'd15)
        begin
            read_addr<=2'd0;
            read_en<=0;
        end
        else if(ct>5'd8)
        begin
            read_addr<=read_addr+3'd1;
            read_en<=1;
        end
        else
        begin
            read_addr<=3'd0;
            read_en<=0;
        end
     end
end
ram ram_block(.clk(clk),.write_addr(write_addr),.write_data(write_data),.read_addr(read_addr),.read_data(read_data),.read_en(read_en));
sipo s1(.clk(clk),.rst(rst),.data_in(read_data),.m1(m1),.m2(m2),.m3(m3),.m4(m4),.m5(m5),.m6(m6),.m7(m7),.m8(m8));
merge_sort merge(.x1(m1),.x2(m2),.x3(m3),.x4(m4),.x5(m5),.x6(m6),.x7(m7),.x8(m8),.clk(clk),.rst(rst),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.y7(y7),.y8(y8));


endmodule
module sipo(
input clk,rst,
input [5:0] data_in,
output reg [5:0] m1,m2,m3,m4,m5,m6,m7,m8
);
reg [4:0]ct1,count;
reg [5:0] sp [7:0];
integer i;
always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        ct1<=5'd0;
        count<=5'd0;
        m1<=5'd0;
        m2<=5'd0;
        m3<=5'd0;
        m4<=5'd0;
        m5<=5'd0;
        m6<=5'd0;
        m7<=5'd0;
        m8<=5'd0;
        for(i=0;i<8;i=i+1)
        begin
            sp[i]<=5'd0;
        end
    end
    else
        if(ct1>5'd15)
        begin
            ct1<=16;
            m1<=sp[0];
            m2<=sp[1];
            m3<=sp[2];
            m4<=sp[3];
            m5<=sp[4];
            m6<=sp[5];
            m7<=sp[6];
            m8<=sp[7];
            count<=0;
        end
        else if(ct1>5'd7)
        begin
            sp[count]<=data_in;
            count<=count+5'd1;
            ct1<=ct1+5'd1;
        end
        else
        begin
            ct1<=ct1+5'd1;
        end
 end
endmodule


module ram(
input clk,write_en,read_en,
input [2:0] write_addr,
input [2:0] read_addr,
input [5:0] write_data,
output reg [5:0] read_data
);
reg [5:0] Register [7:0];
always@(posedge clk)
begin
    if(write_en)
        Register[write_addr]<=write_data;
end
always@(posedge clk)
begin
    if(read_en)
        read_data<=Register[read_addr];
end
endmodule

module merge_sort(
input [5:0] x1,x2,x3,x4,x5,x6,x7,x8,
input clk,rst,
output reg [5:0] y1,y2,y3,y4,y5,y6,y7,y8
    );
    wire [5:0] m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22,m23,m24,m25,m26;
    reg [5:0] r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14;
    n4 n4_1(.x1(x1),.x2(x2),.x3(x3),.x4(x4),.clk(clk),.rst(rst),.y1(m1),.y2(m2),.y3(m3),.y4(m4));
    n4 n4_2(.x1(x5),.x2(x6),.x3(x7),.x4(x8),.clk(clk),.rst(rst),.y1(m5),.y2(m6),.y3(m7),.y4(m8));
    bn bn_m1(.x1(m1),.x2(m5),.clk(clk),.rst(rst),.y1(m9),.y2(m10));
    bn bn_m2(.x1(m2),.x2(m6),.clk(clk),.rst(rst),.y1(m11),.y2(m12));
    bn bn_m3(.x1(m3),.x2(m7),.clk(clk),.rst(rst),.y1(m13),.y2(m14));
    bn bn_m4(.x1(m4),.x2(m8),.clk(clk),.rst(rst),.y1(m15),.y2(m16));
    bn bn_m5(.x1(m10),.x2(m11),.clk(clk),.rst(rst),.y1(m17),.y2(m18));
    bn bn_m6(.x1(m12),.x2(m13),.clk(clk),.rst(rst),.y1(m19),.y2(m20));
    bn bn_m7(.x1(m14),.x2(m15),.clk(clk),.rst(rst),.y1(m21),.y2(m22));
    bn bn_m8(.x1(m18),.x2(m19),.clk(clk),.rst(rst),.y1(m23),.y2(m24));
    bn bn_m9(.x1(m20),.x2(m21),.clk(clk),.rst(rst),.y1(m25),.y2(m26));
    always@(posedge clk or negedge rst)
    begin
    if(rst)
    begin
        y1<=6'd0;
        y2<=6'd0;
        y3<=6'd0;
        y4<=6'd0;
        y5<=6'd0;
        y6<=6'd0;
        y7<=6'd0;
        y8<=6'd0;
    end
    else
    begin
        r1<=m9;
        r2<= m17;
        r3<= m23;
        r4<= m24;
        r5<=m25;
        r6<=m26;
        r7<=m22;
        r8<=m16;
        r9<=r1;
        r10<=r2;
        r11<=r7;
        r12<=r8;
        r13<=r9;
        r14<=r12;
        y1<=r13;
        y2<=r10;
        y3<=r3;
        y4<=r4;
        y5<=r5;
        y6<=r6;
        y7<=r11;
        y8<=r14;
     end
    end
endmodule
module n4(input [5:0] x1,x2,x3,x4,input clk,rst,output reg [5:0] y1,y2,y3,y4);
wire [5:0]m1,m2,m3,m4,m5,m6,m7,m8,m9,m10;
reg [5:0]m11,m12;
bn bn1(.x1(x1),.x2(x2),.clk(clk),.rst(rst),.y1(m1),.y2(m2));
bn bn2(.x1(x3),.x2(x4),.clk(clk),.rst(rst),.y1(m3),.y2(m4));
bn bn3(.x1(m1),.x2(m3),.clk(clk),.rst(rst),.y1(m5),.y2(m6));
bn bn4(.x1(m2),.x2(m4),.clk(clk),.rst(rst),.y1(m7),.y2(m8));
bn bn5(.x1(m6),.x2(m7),.clk(clk),.rst(rst),.y1(m9),.y2(m10));
always@(posedge clk or negedge rst)
begin
if(rst)
begin
    y1<=6'd0;
    y2<=6'd0;
    y3<=6'd0;
    y4<=6'd0;
end
else
begin
    m11<=m5;
    m12<=m8;
    y1<=m11;
    y2<=m9;
    y3<=m10;
    y4<=m12;
end
end
endmodule
module bn(input [5:0]x1,x2, input clk,rst, output reg [5:0]y1,y2);
wire [1:0]s;
assign s={x1[5],x2[5]};
always@(posedge clk or negedge rst)
begin
    if(rst)
    begin
        y1<=6'd0;
        y2<=6'd0;
    end
    else
        case(s)
        2'b00:
        begin
        if(x2>x1)
        begin
            y1<=x2;
            y2<=x1;
        end
        else
        begin
            y1<=x1;
            y2<=x2;
        end
        end
        2'b01:
        begin
            y1<=x1;
            y2<=x2;
        end
        2'b10:
        begin
            y1<=x2;
            y2<=x1;
        end
        2'b11:
        begin
        if(x2>x1)
        begin
             y1<=x2;
             y2<=x1;
        end
        else
        begin
             y1<=x1;
             y2<=x2;
        end
        end
      endcase
end
endmodule