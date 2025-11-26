module bit_comparator_1(
    input  wire A,
    input  wire B,
    output wire Y_equal,
    output wire Y_less,
    output wire Y_greater
);

    assign Y_equal   = (A == B);
    assign Y_less    = (A < B);
    assign Y_greater = (A > B);
    
endmodule