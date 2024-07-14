`timescale 1ns / 1ps

module seven_segment(
input wire reset,
input wire [7:0] hours_disp,
input wire [7:0] min_disp,
input wire [7:0] sec_disp,
output reg [41:0] time_segments
);
    
reg [6:0] seven_seg [9:0];

initial begin
    seven_seg[0] = 7'b1000000; 
    seven_seg[1] = 7'b1111001; 
    seven_seg[2] = 7'b0100100; 
    seven_seg[3] = 7'b0110000; 
    seven_seg[4] = 7'b0011001; 
    seven_seg[5] = 7'b0010010;
    seven_seg[6] = 7'b0000010; 
    seven_seg[7] = 7'b1111000; 
    seven_seg[8] = 7'b0000000; 
    seven_seg[9] = 7'b0010000; 
    end
    
always @(*) begin
    if (reset) begin
        time_segments = {seven_seg[0], seven_seg[0], seven_seg[0], seven_seg[0], seven_seg[0], seven_seg[0]};
        end 
    else begin
    time_segments = {seven_seg[hours_disp / 10], seven_seg[hours_disp % 10], 
    seven_seg[min_disp / 10], seven_seg[min_disp % 10], 
    seven_seg[sec_disp / 10], seven_seg[sec_disp % 10]};
        end
    end
endmodule
