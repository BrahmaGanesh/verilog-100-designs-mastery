module multiplier_4bit(
    input   wire [3:0] a,
    input   wire [3:0] b,
    output  wire [7:0] product
);

    wire [3:0] pp0,pp1,pp2,pp3;
    wire [7:0] sum1,sum2,sum3;

    assign pp0  = a & {4{b[0]}};
    assign pp1  = a & {4{b[1]}};
    assign pp2  = a & {4{b[2]}};
    assign pp3  = a & {4{b[3]}};

    assign sum1 = {3'b000, pp1, 1'b0} + {4'b0000, pp0};
    assign sum2 = {2'b00,  pp2, 2'b00} + sum1;
    assign sum3 = {1'b0,   pp3, 3'b000} + sum2;

    assign product = sum3;

endmodule
