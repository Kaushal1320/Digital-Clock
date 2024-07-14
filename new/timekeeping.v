module timekeeping (
    input wire clk_1hz,
    input wire reset,
    input wire load_time,
    input wire [7:0] load_hours,
    input wire [7:0] load_minutes,
    input wire [7:0] load_seconds,
    output reg [7:0] hours_disp,
    output reg [7:0] min_disp,
    output reg [7:0] sec_disp
    );

    always @(posedge clk_1hz or posedge reset) begin
        if (reset) begin
            sec_disp <= 0;
            min_disp <= 0;
            hours_disp <= 0;
            end 
        else begin
            if (sec_disp == 59) begin
                sec_disp <= 0;
                if (min_disp == 59) begin
                    min_disp <= 0;
                    if (hours_disp == 23) begin
                        hours_disp <= 0;
                        end 
                    else begin
                        hours_disp <= hours_disp + 1;
                        end
                    end 
                 else begin
                     min_disp <= min_disp + 1;
                     end
                 end 
             else begin
                sec_disp <= sec_disp + 1;
                  end
             end
        end

    always @(posedge clk_1hz or posedge reset) begin
        if (reset) begin
            hours_disp <= 0;
            min_disp <= 0;
            sec_disp <= 0;
            end 
         else begin
            if (load_time) begin
                hours_disp <= load_hours;
                min_disp <= load_minutes;
                sec_disp <= load_seconds;
                end
            end
        end

endmodule
