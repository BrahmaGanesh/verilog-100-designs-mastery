module adder_4bit(
    input   wire  [3:0] a,
    input   wire  [3:0] b,
    input   wire        cin,
    output  wire  [3:0] a_sum,
    output  wire        a_carry
);
    wire c1,c2,c3;

    full_adder f1 (.A(a[0]),.B(b[0]),.Cin(cin),.f_sum(a_sum[0]),.f_carry(b1));
    full_adder f2 (.A(a[1]),.B(b[1]),.Cin(b1),.f_sum(a_sum[1]),.f_carry(b2));
    full_adder f3 (.A(a[2]),.B(b[2]),.Cin(b2),.f_sum(a_sum[2]),.f_carry(b3));
    full_adder f4 (.A(a[3]),.B(b[3]),.Cin(b3),.f_sum(a_sum[3]),.f_carry(a_carry));

endmodule
