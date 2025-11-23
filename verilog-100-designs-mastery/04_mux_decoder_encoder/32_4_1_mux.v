module mux_4to1(
    input   wire  [3:0] I,
    input   wire  [1:0] SEL,
    output  reg   Y_4mux
);

    always @(*) begin
        case(SEL)
            2'b00 : Y_4mux = I[0];
            2'b01 : Y_4mux = I[1];
            2'b10 : Y_4mux = I[2];
            2'b11 : Y_4mux = I[3];
            default : Y_4mux = 1'b0;
        endcase
    end
endmodule