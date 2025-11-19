module NOR_gate(
    input   A,
    input   B,
    output  Y_nor
);

    assign Y_nor = ~(A | B);

endmodule