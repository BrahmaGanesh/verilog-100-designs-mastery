module full_adder(
    input  wire A,
    input  wire B,
    input  wire Cin,
    output wire f_sum,
    output wire f_carry
);

assign f_sum    = A ^ B ^ Cin;
assign f_carry  = (A & B) | (B & Cin) | (Cin & A);

endmodule