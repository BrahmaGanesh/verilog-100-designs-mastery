module priority_encoder_4bit(
    input  wire [3:0] sel,
    output reg  [1:0] Y
);

always @(*) begin
    casex (sel)
        4'b1xxx : Y=2'b11;
        4'b01xx : Y=2'b10;
        4'b001x : Y=2'b01;
        4'b0001 : Y=2'b00;
        default : Y=2'b00;
    endcase
end
endmodule