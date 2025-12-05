module pwm_generator #(
    parameter COUNTER_WIDTH = 8  
)(
    input  wire clk,             
    input  wire reset_n,         
    input  wire [COUNTER_WIDTH-1:0] duty, 
    output reg  pwm_out         
);

    reg [COUNTER_WIDTH-1:0] counter;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    always @(*) begin
        pwm_out = (counter < duty) ? 1'b1 : 1'b0;
    end

endmodule
