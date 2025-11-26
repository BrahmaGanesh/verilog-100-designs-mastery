module magnitude_comparator #(parameter N = 8)(
    input  wire [N-1:0] a,
    input  wire [N-1:0] b,
    output wire         Y_greater,
    output wire         Y_less,
    output wire         Y_equal
);

assign Y_greater = (a > b);
assign Y_less = (a < b);
assign Y_equal = (a == b);

endmodule
