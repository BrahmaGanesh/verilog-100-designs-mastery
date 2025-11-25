module carry_save_adder(
    input  [7:0] a,
    input  [7:0] b,
    input  [7:0] c,
    output [7:0] sum,
    output [7:0] carry
);

    assign sum   = a ^ b ^ c;
    assign carry = (a & b) | (b & c) | (a & c);

endmodule
module csa_final_adder(
    input  [7:0] a,
    input  [7:0] b,
    input  [7:0] c,
    output [8:0] final_sum
);

    wire [7:0] sum_bits;
    wire [7:0] carry_bits;

    carry_save_adder csa(
        .a(a),
        .b(b),
        .c(c),
        .sum(sum_bits),
        .carry(carry_bits)
    );

    wire [8:0] shifted_carry = {carry_bits, 1'b0};
    assign final_sum = {1'b0, sum_bits} + shifted_carry;
endmodule
