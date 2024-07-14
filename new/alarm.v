`timescale 1ns / 1ps

module alarm(
input wire clk_1hz,
input wire reset,
input wire set_alarm_enable,
input wire [7:0] set_alarm_hours,
input wire [7:0] set_alarm_minutes,
input wire turn_off_alarm,
input wire [7:0] current_hours,
input wire [7:0] current_minutes,
output reg alarm_set,
output reg [7:0] alarm_hours,
output reg [7:0] alarm_minutes,
output reg alarm_trigger 
);

always@(posedge clk_1hz or posedge reset) begin
if(reset) begin
    alarm_set <= 0;
    alarm_hours <= 0;
    alarm_minutes <= 0;
    alarm_trigger <= 0;
    end
else begin
    alarm_trigger <= 0;
    
    if (set_alarm_enable) begin
    alarm_set <= 1; 
        if (set_alarm_hours <=23 && set_alarm_minutes <=59) begin 
            alarm_hours <= set_alarm_hours;
            alarm_minutes <= set_alarm_minutes;
            end
       
          if (turn_off_alarm) begin
            alarm_set <= 0;
            end   
        end   
    end
end

always @(posedge clk_1hz or posedge reset) begin
    if (reset) begin
        alarm_trigger <= 0;
        end
    else begin
        alarm_trigger <= 0;
        if ( alarm_set && (current_hours == alarm_hours) && (current_minutes == alarm_minutes)) begin
            alarm_trigger <= 1;
            end
        end
    end
endmodule
