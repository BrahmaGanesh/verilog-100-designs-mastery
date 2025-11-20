module subtractor_4bit(
    input   wire  [3:0] a,
    input   wire  [3:0] b,
    input   wire        bin,
    output  wire [3:0]  s_diff,
    output  wire        s_barrow
);
    wire b1,b2,b3;
    full_subtractor s1(.A(a[0]),.B(b[0]),.Bin(bin),.f_diff(s_diff[0]),.f_barrow(b1));
    full_subtractor s2(.A(a[1]),.B(b[1]),.Bin(b1),.f_diff(s_diff[1]),.f_barrow(b2));
    full_subtractor s3(.A(a[2]),.B(b[2]),.Bin(b2),.f_diff(s_diff[2]),.f_barrow(b3));
    full_subtractor s4(.A(a[3]),.B(b[3]),.Bin(b3),.f_diff(s_diff[3]),.f_barrow(s_barrow));

endmodule