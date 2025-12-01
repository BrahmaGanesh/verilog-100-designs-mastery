module jk_flip_flop(
    input   wire J,
    input   wire K,
    input   wire clk,
    input   wire reset_n,
    output  reg  Q,
    output  wire Q_bar  
);

    always @(posedge clk or negedge reset_n) begin
        if(!reset_n)
            Q <= 1'b0;
        else
            case({J,K})
                2'b00 : Q <= Q;
                2'b01 : Q <= 0;
                2'b10 : Q <= 1;
                2'b11 : Q <= ~Q;
            endcase
    end
    assign Q_bar = ~Q;
endmodule
        