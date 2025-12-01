module edge_detector(
    input  wire clk,
    input  wire reset_n,
    input  wire signal_in,
    output reg  rising_edge_pulse,
    output reg  falling_edge_pulse
);

    reg signal_d; 

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            signal_d          <= 1'b0;
            rising_edge_pulse <= 1'b0;
            falling_edge_pulse<= 1'b0;
        end else begin
            rising_edge_pulse  <= signal_in & ~signal_d;

            falling_edge_pulse <= ~signal_in & signal_d;
            
            signal_d <= signal_in;
        end
    end

endmodule
