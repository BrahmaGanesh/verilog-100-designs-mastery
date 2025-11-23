module decoder_2to4(
    input   wire [1:0] in_d,
    output  reg [3:0] Y_decoder
);

    always @(*) begin
        case(in_d)
            2'b00 : Y_decoder = 4'b0001;
            2'b01 : Y_decoder = 4'b0010;
            2'b10 : Y_decoder = 4'b0100;
            2'b11 : Y_decoder = 4'b1000;
            default : Y_decoder  = 4'b0000;
        endcase
    end
endmodule
