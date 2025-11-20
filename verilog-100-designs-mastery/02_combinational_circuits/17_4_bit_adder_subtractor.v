module adder_subtractor_4bit(
    input   wire [3:0] a,
    input   wire [3:0] b,
    input   wire       mode,
    input   wire       Cin, 
    output  wire [3:0] Sum,
    output  wire       Cout
);

wire [3:0] B_xor;
assign B_xor = b ^ {4{mode}};
wire c1, c2, c3;

full_adder fa0 (.A(a[0]), .B(B_xor[0]), .Cin(mode ^ Cin), .f_sum(Sum[0]), .f_carry(c1));
full_adder fa1 (.A(a[1]), .B(B_xor[1]), .Cin(c1),        .f_sum(Sum[1]), .f_carry(c2));
full_adder fa2 (.A(a[2]), .B(B_xor[2]), .Cin(c2),        .f_sum(Sum[2]), .f_carry(c3));
full_adder fa3 (.A(a[3]), .B(B_xor[3]), .Cin(c3),        .f_sum(Sum[3]), .f_carry(Cout));
endmodule
