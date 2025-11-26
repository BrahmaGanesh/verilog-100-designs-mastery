module zero_detector #(parameter N = 8)(
    input  wire [N-1:0] a,
    output wire         is_zero
);

    assign is_zero = (a == {N{1'b0}});

endmodule
