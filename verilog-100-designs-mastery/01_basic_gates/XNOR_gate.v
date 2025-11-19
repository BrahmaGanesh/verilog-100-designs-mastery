module XNOR_gate(
    input   A,
    input   B,
    output  Y_xnor
);

    assign Y_xnor = ~(A ^ B);

endmodule