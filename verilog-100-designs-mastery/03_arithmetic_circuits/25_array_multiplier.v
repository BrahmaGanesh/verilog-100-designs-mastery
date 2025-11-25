module array_multiplier (
    input  [7:0] a,
    input  [7:0] b,
    output [15:0] product
);
    wire [7:0] pp [7:0];

    genvar i, j;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_pp
            for (j = 0; j < 8; j = j + 1) begin : gen_and
                assign pp[i][j] = a[j] & b[i];
            end
        end
    endgenerate

    assign product =
          ({8'b0, pp[0]} << 0) +
          ({8'b0, pp[1]} << 1) +
          ({8'b0, pp[2]} << 2) +
          ({8'b0, pp[3]} << 3) +
          ({8'b0, pp[4]} << 4) +
          ({8'b0, pp[5]} << 5) +
          ({8'b0, pp[6]} << 6) +
          ({8'b0, pp[7]} << 7);
endmodule
