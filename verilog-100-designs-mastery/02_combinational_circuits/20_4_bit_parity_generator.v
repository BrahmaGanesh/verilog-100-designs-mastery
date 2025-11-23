module parity_generator_4bit(
    input  wire [3:0] data,
    output reg  p_even,
    output reg  p_odd

);
assign p_odd    = ^data;
assign p_even   = ~p_odd;
endmodule