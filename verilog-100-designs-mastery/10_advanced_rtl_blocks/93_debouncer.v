module debouncer #(
    parameter WIDTH = 20 
)(
    input  wire clk,
    input  wire reset_n,
    input  wire noisy_in,   
    output reg  clean_out   
);

    reg [WIDTH-1:0] counter;
    reg stable_state;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            counter      <= 0;
            stable_state <= 0;
            clean_out    <= 0;
        end else begin
            if (noisy_in != stable_state) begin
                counter <= counter + 1;
                if (counter == {WIDTH{1'b1}}) begin
                    stable_state <= noisy_in;
                    clean_out    <= noisy_in;
                    counter      <= 0;
                end
            end else begin
                counter <= 0;
            end
        end
    end
endmodule
