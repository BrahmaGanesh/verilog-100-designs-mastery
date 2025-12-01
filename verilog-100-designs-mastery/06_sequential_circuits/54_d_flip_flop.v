module D_flip_flop(
    input   wire D,
    input   wire clk,
    input   wire reset_n,
    output  reg  Q,
    output  wire Q_bar  
);

    always @(posedge clk or negedge reset_n) begin
        if(!reset_n)
            Q <= 1'b0;
        else
            Q <= D;
    end
    assign Q_bar = ~Q;
endmodule
        