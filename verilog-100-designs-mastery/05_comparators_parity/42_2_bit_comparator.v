module bit_comparator_2(
    input  wire [1:0] a,
    input  wire [1:0] b,
    output wire Y_equal,
    output wire Y_less,
    output wire Y_greater
);

    assign Y_equal   = (a == b);
    assign Y_less    = (a < b);
    assign Y_greater = (a > b);

endmodule