module clock_divider #(
    parameter DIVISOR = 4 
)(
    input  wire clk_in,   
    input  wire reset_n,  
    output reg  clk_out   
);

    integer counter;

    always @(posedge clk_in or negedge reset_n) begin
        if (!reset_n) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter == (DIVISOR/2 - 1)) begin
                clk_out <= ~clk_out;
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
