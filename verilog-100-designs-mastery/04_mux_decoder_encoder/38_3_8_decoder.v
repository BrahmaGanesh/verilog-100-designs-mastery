module decoder_3to8(
    input   wire [2:0] in_d,   
    output  reg [7:0] Y_decoder
);

    always @(*) begin
        case(in_d)
            3'b000 : Y_decoder = 8'b00000001;
            3'b001 : Y_decoder = 8'b00000010;
            3'b010 : Y_decoder = 8'b00000100;
            3'b011 : Y_decoder = 8'b00001000;
            3'b100 : Y_decoder = 8'b00010000;
            3'b101 : Y_decoder = 8'b00100000;
            3'b110 : Y_decoder = 8'b01000000;
            3'b111 : Y_decoder = 8'b10000000;
            default : Y_decoder  = 8'b00000000;
        endcase
    end
endmodule