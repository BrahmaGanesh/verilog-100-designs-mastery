module full_subtractor(
    input  wire A,
    input  wire B,
    input  wire Bin,
    output wire f_diff,
    output wire f_barrow
);

assign f_diff    = A ^ B ^ Bin;
assign f_barrow  = (~A & B) | (Bin & ~(A ^ B));

endmodule