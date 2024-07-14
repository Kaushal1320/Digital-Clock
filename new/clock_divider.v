`timescale 1ns / 1ps

module clock_divider(
input wire clk_50Mhz,
input wire reset,
output reg clk_1hz
);
reg [24:0] clk_counter;

always@(posedge clk_50Mhz or posedge reset) begin
   if (reset) begin
    clk_counter <= 0;
    clk_1hz <= 0;
    end
   else begin
    if (clk_counter == 25000000-1) begin
        clk_counter <=0;
        clk_1hz <= ~clk_1hz; end
    else
        clk_counter <= clk_counter+1;
    end
end
endmodule
