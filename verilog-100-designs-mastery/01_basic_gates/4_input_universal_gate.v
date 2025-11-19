module NOR_4gate(
    input   A,
    input   B,
    input   C,
    input   D,
    output  Y_nor_4
);

    assign Y_nor_4  = ~( A | B | C | D);  

endmodule