module equality_comparator #(parameter N = 8)(
    input  wire [N-1:0] a,
    input  wire [N-1:0] b,
    output wire         eq
);

    assign eq = (a == b);
endmodule
