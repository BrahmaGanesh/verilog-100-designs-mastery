module schmitt_trigger(
    input  wire clk,
    input  wire reset_n,
    input  wire signal_in,
    output reg  signal_out
);

    parameter HIGH_TH = 1'b1; 
    parameter LOW_TH  = 1'b0; 

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            signal_out <= 1'b0;
        else begin          
            if (signal_in >= HIGH_TH)
                signal_out <= 1'b1;
            else if (signal_in <= LOW_TH)
                signal_out <= 1'b0;
            else
                signal_out <= signal_out; 
        end
    end

endmodule
