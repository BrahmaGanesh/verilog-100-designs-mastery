module half_adder(
    input  wire A,
    input  wire B,
    output wire h_sum,
    output wire h_carry
);

assign h_sum    = A ^ B;
assign h_carry  = A & B;

endmodule