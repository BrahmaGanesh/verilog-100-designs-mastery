 module sr_latch(
    input   wire S,
    input   wire R,
    output  reg  Q,
    output  wire  Q_bar   
 );

 always @(*) begin
    case({S,R})
        2'b00 : Q = Q;
        2'b01 : Q = 1'b0;
        2'b10 : Q = 1'b1;
        2'b11 : Q = 1'bx;
        default : Q = 1'b0;
    endcase
end

assign Q_bar = ~Q;
endmodule
