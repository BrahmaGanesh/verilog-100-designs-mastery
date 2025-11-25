module barrel_shifter_right(
    input   wire [7:0] data,
    input   wire [2:0] shift,
    output  wire [7:0] out
);

    assign out = data >> shift;
endmodule