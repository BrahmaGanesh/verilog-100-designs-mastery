module pulse_detector(
    input  wire clk,
    input  wire reset_n,
    input  wire signal_in,
    output reg  pulse_out
);

    reg signal_d; 

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            signal_d  <= 1'b0;
            pulse_out <= 1'b0;
        end else begin
            pulse_out <= signal_in & ~signal_d;
            signal_d  <= signal_in;
        end
    end

endmodule
