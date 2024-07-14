`timescale 1ns / 1ps

module digi_clk_top(
input wire clk_50Mhz,
input wire reset,
input wire load_time,
input wire [7:0] load_hours,
input wire [7:0] load_minutes,
input wire [7:0] load_seconds,
input wire set_alarm_enable,
input wire [7:0] set_alarm_hours,
input wire [7:0] set_alarm_minutes,
input wire turn_off_alarm,
output wire [41:0] time_segments,
output wire alarm_trigger,
output wire alarm_set
 );
 
 wire clk_1hz;
 wire [7:0] hours_disp;
 wire [7:0] min_disp;
 wire [7:0] sec_disp;
 wire [7:0] alarm_hours;
 wire [7:0] alarm_minutes;
 
 clock_divider clock( .clk_50Mhz(clk_50Mhz), .reset(reset), .clk_1hz(clk_1hz));
 
 timekeeping timekeeping(
        .clk_1hz(clk_1hz),
        .reset(reset),
        .load_time(load_time),
        .load_hours(load_hours),
        .load_minutes(load_minutes),
        .load_seconds(load_seconds),
        .hours_disp(hours_disp),
        .min_disp(min_disp),
        .sec_disp(sec_disp)
    );
    
 seven_segment sev_seg(.reset(reset), .hours_disp(hours_disp), .min_disp(min_disp), .sec_disp(sec_disp), .time_segments(time_segments));
 
 alarm alarm(.clk_1hz(clk_1hz), .reset(reset), .set_alarm_enable(set_alarm_enable), .set_alarm_hours(set_alarm_hours), 
             .set_alarm_minutes(set_alarm_minutes),.turn_off_alarm(turn_off_alarm), 
             .current_hours(hours_disp), .current_minutes(min_disp), .alarm_set(alarm_set), .alarm_hours(alarm_hours), 
             .alarm_minutes(alarm_minutes), .alarm_trigger(alarm_trigger));
 
endmodule
