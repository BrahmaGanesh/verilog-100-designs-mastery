module booth_multiplier (
    input  signed [7:0] multiplicand,
    input  signed [7:0] multiplier,
    output signed [15:0] product
);

    reg signed [15:0] A, S, P;
    integer i;

    always @(*) begin
        A = {multiplicand, 8'b0};

        S = {-multiplicand, 8'b0};

        P = {{8{multiplier[7]}}, multiplier, 1'b0};

        for (i = 0; i < 8; i = i + 1) begin
            case (P[1:0])
                2'b01: P = P + A;   
                2'b10: P = P + S;   
            endcase
            P = P >>> 1;
        end
    end

    assign product = P[15:0];
endmodule
