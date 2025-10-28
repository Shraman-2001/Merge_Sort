`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2025 21:51:18
// Design Name: 
// Module Name: merge_sort_tb
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


module merge_sort_tb();
reg [5:0] x1,x2,x3,x4,x5,x6,x7,x8;
reg clk,rst;
wire [5:0] y1,y2,y3,y4,y5,y6,y7,y8;
top ms1(.x1(x1),.x2(x2),.x3(x3),.x4(x4),.x5(x5),.x6(x6),.x7(x7),.x8(x8),.clk(clk),.rst(rst),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.y7(y7),.y8(y8));
initial begin
x1=6'b110011;x2=6'd4;x3=6'b101101;x4=6'd2;x5=6'd1;x6=6'd8;x7=6'd5;x8=6'd7;rst=1;
#5 rst=0;
//#500 $finish;
end
always begin
clk=1;
forever #5 clk=~clk;
end
endmodule
