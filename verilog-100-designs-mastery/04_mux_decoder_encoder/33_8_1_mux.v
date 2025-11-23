module mux_8to1(
    input   wire  [7:0] I,
    input   wire  [2:0] SEL,
    output  reg   Y_8mux
);

    always @(*) begin
        case(SEL)
            3'b000 : Y_8mux = I[0];
            3'b001 : Y_8mux = I[1];
            3'b010 : Y_8mux = I[2];
            3'b011 : Y_8mux = I[3];
            3'b100 : Y_8mux = I[4];
            3'b101 : Y_8mux = I[5];
            3'b110 : Y_8mux = I[6];
            3'b111 : Y_8mux = I[7];
            default : Y_8mux = 1'b0;
        endcase
    end
endmodule