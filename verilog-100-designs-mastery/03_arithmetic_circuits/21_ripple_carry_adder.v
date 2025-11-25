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
module ripple_carry_adder(
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire cin,
    output wire [3:0] Sum,
    output wire Carry
);
wire c1,c2,c3;
full_adder f0 (.A(a[0]),.B(b[0]),.Cin(cin),.f_sum(Sum[0]),.f_carry(c1));
full_adder f1 (.A(a[1]),.B(b[1]),.Cin(c1),.f_sum(Sum[1]),.f_carry(c2));
full_adder f2 (.A(a[2]),.B(b[2]),.Cin(c2),.f_sum(Sum[2]),.f_carry(c3));
full_adder f3 (.A(a[3]),.B(b[3]),.Cin(c3),.f_sum(Sum[3]),.f_carry(Carry));

endmodule
