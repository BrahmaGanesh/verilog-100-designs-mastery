module comparator_4bit(
    input wire [3:0] A,
    input wire [3:0] B,
    output reg A_equal_B,
    output reg A_less_B,
    output reg A_greater_B
);

    always @(*) begin
        A_equal_B   = 1'b0;
        A_greater_B = 1'b0;
        A_less_B    = 1'b0;

        if(A==B)        A_equal_B=1'b1;
        else if(A>B)    A_greater_B = 1'b1;
        else            A_less_B = 1'b1;
    end
endmodule
        