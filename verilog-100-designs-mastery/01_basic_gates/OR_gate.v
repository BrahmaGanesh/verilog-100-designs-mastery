module OR_gate(
    input   A,
    input   B,
    output  Y_or
);

    assign Y_or = A | B;

endmodule