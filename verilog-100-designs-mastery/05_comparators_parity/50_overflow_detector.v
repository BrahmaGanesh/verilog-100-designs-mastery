module overflow_detector #(parameter N = 8)(
    input  wire [N-1:0] a,
    input  wire [N-1:0] b,
    input  wire [N-1:0] sum,
    output wire         unsigned_overflow,
    output wire         signed_overflow
);
    wire cin  = 1'b0;

    assign unsigned_overflow = (a + b) > {N{1'b1}};
    assign signed_overflow = (~a[N-1] & ~b[N-1] &  sum[N-1]) |
                         ( a[N-1] &  b[N-1] & ~sum[N-1]);

endmodule
