module mux_16to1(
    input   wire  [15:0] I,
    input   wire  [3:0] SEL,
    output  wire   Y_16mux
);

    assign Y_16mux  =  I[SEL];
endmodule