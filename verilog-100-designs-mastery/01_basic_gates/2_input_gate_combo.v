module combo_2input(
    input   A,
    input   B,
    output  Y_combo
);

    assign Y_combo = (A & B) | (A ^ B);

endmodule