module priority_encoder_8to3 (
    input  wire [7:0] in,
    output reg  [2:0] y_encoder
);

    always @(*) begin
        casex (in)
            8'b1xxxxxxx: y_encoder = 3'b111; 
            8'b01xxxxxx: y_encoder = 3'b110; 
            8'b001xxxxx: y_encoder = 3'b101; 
            8'b0001xxxx: y_encoder = 3'b100; 
            8'b00001xxx: y_encoder = 3'b011; 
            8'b000001xx: y_encoder = 3'b010; 
            8'b0000001x: y_encoder = 3'b001; 
            8'b00000001: y_encoder = 3'b000; 
            default:     y_encoder = 3'b000;
        endcase
    end
endmodule
