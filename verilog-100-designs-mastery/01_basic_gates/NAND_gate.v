module NAND_gate(
    input   A,
    input   B,
    output  Y_nand
);

    assign Y_nand = ~(A & B);

endmodule