module half_subtractor(
    input  wire A,
    input  wire B,
    output wire h_diff,
    output wire h_barrow
);

assign h_diff    = A ^ B;
assign h_barrow  = ~A & B;

endmodule